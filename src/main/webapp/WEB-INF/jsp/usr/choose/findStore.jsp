<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="가게 정보 검색" />
<%@ include file="../../common/head.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주변 샐러드 가게 찾기</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBPAEOD6-8zx3BZEqZffoi7oyp8eePQuaM&libraries=places"></script>
    <script>
        let map;
        let service;
        let infowindow;

        function initMap() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    const userLocation = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };

                    // Google Maps 초기화
                    map = new google.maps.Map(document.getElementById('map'), {
                        center: userLocation,
                        zoom: 15
                    });

                    // 사용자의 위치에 마커 표시
                    const marker = new google.maps.Marker({
                        position: userLocation,
                        map: map,
                        title: "Your location"
                    });

                    service = new google.maps.places.PlacesService(map);
                    infowindow = new google.maps.InfoWindow();

                    // 주변 샐러드 가게 검색
                    searchNearby(userLocation);
                }, function() {
                    alert('위치 정보를 사용할 수 없습니다.');
                });
            } else {
                alert('이 브라우저는 위치 정보를 지원하지 않습니다.');
            }
        }

        function searchNearby(location) {
            const request = {
                location: location,
                radius: '5000',
                type: ['restaurant'],
                keyword: '샐러드'
            };

            service.nearbySearch(request, function(results, status) {
                if (status === google.maps.places.PlacesServiceStatus.OK) {
                    displayResults(results);
                    for (let i = 0; i < results.length; i++) {
                        createMarker(results[i]);
                    }
                } else {
                    alert('주변 샐러드 가게를 찾을 수 없습니다.');
                }
            });
        }

        function createMarker(place) {
            const marker = new google.maps.Marker({
                map: map,
                position: place.geometry.location
            });

            google.maps.event.addListener(marker, 'click', function() {
                infowindow.setContent(place.name);
                infowindow.open(map, this);
            });
        }

        function displayResults(places) {
            const placesList = document.getElementById('places');
            placesList.innerHTML = '';

            places.slice(0, 5).forEach(function(place) {
                const li = document.createElement('li');
                const link = document.createElement('a');
                link.href = '#';
                link.textContent = place.name;
                link.onclick = function() {
                    getPlaceDetails(place.place_id);
                    return false;
                };
                li.appendChild(link);
                placesList.appendChild(li);
            });
        }

        function getPlaceDetails(placeId) {
            const request = {
                placeId: placeId,
                fields: ['name', 'formatted_address', 'website', 'formatted_phone_number']
            };

            service.getDetails(request, function(place, status) {
                if (status === google.maps.places.PlacesServiceStatus.OK) {
                    const details = document.getElementById('place-details');
                    let websiteHtml = '';
                    if (place.website) {
                        websiteHtml = '<p><a href="' + place.website + '" target="_blank">웹사이트 방문하기</a></p>'; // 수정된 부분: 문자열 연결 사용
                    }

                    // 수정된 부분: 문자열 연결을 통해 HTML을 동적으로 생성
                    details.innerHTML = 
                        '<h2>' + place.name + '</h2>' +
                        '<p>주소: ' + place.formatted_address + '</p>' +
                        '<p>전화번호: ' + (place.formatted_phone_number || '정보 없음') + '</p>' + // 수정된 부분: 전화번호가 없는 경우 '정보 없음' 표시
                        websiteHtml; // 수정된 부분: 웹사이트 링크 추가
                } else {
                    alert('가게 세부 정보를 가져올 수 없습니다.');
                }
            });
        }

        function performSearch() {
            const keyword = document.getElementById('searchKeyword').value;
            if (keyword) {
                const userLocation = map.getCenter();
                const request = {
                    location: userLocation,
                    radius: '5000',
                    type: ['restaurant'],
                    keyword: keyword
                };

                service.nearbySearch(request, function(results, status) {
                    if (status === google.maps.places.PlacesServiceStatus.OK) {
                        displayResults(results);
                        for (let i = 0; i < results.length; i++) {
                            createMarker(results[i]);
                        }
                    } else {
                        alert('검색 결과가 없습니다.');
                    }
                });
            }
        }
    </script>
    <style>
        #map {
            height: 80vh;
            width: 100%;
        }
        #places li > a:hover {
            font-weight: bold;
            text-decoration: underline;
        }
    </style>
</head>
<body onload="initMap()" class="bg-gray-100">
    <div class="flex justify-center items-center min-h-screen p-6">
        <div class="w-full max-w-4xl bg-white p-8 rounded-lg shadow-md">
            <h1 class="text-2xl font-bold mb-6 text-center">주변 샐러드 가게 찾기</h1>
            <div class="flex justify-center mb-4">
                <input id="searchKeyword" type="text" placeholder="검색어를 입력하세요" class="border border-gray-400 p-2 rounded-l-lg w-full max-w-md">
                <button onclick="performSearch()" class="bg-blue-500 text-white p-2 rounded-r-lg">검색</button>
            </div>
            <div class="flex">
                <div id="map" class="rounded-lg border border-gray-300 flex-grow"></div>
                <div class="flex flex-col ml-4 w-1/3">
                	<h2 class="text-xl font-bold mt-4 text-center">주변 가게정보</h2>
                    <div id="places" class="mt-4 list-disc pl-5 border border-green-500  border-y-0 p-4 overflow-auto"></div>
                    <div id="place-details" class="mt-4 mb-4 p-4 border border-gray-300 rounded-md"></div>
                    <button id="exercisePlanButton" class="w-full bg-green-500 text-white py-2 rounded-lg hover:bg-green-600">운동 프로그램 세우기</button>
                </div>
            </div>
            <button class="btn btn-active btn-sm mt-4" onclick="history.back();">뒤로가기</button>
        </div>
    </div>
    <script>
		 // 주변 식단가게 찾아보기 버튼 클릭 이벤트 추가
		document.getElementById('exercisePlanButton').addEventListener('click', function() {
			window.location.href = '/usr/choose/exercisePlan';
		});
    </script>
</body>
</html>
