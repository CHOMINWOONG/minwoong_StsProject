<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CHOOSE FINDSTORE" />
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

            places.forEach(function(place) {
                const li = document.createElement('li');
                const link = document.createElement('a');
                link.href = '#';
                link.textContent = place.name;
                link.onclick = function() {
                    getPlaceDetails(place.place_id);
                    return false;  // Prevent default link behavior
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
                    details.innerHTML = `
                        <h2>${place.name}</h2>
                        <p>주소: ${place.formatted_address}</p>
                        <p>전화번호: ${place.formatted_phone_number}</p>
                        <p><a href="${place.website}" target="_blank">웹사이트 방문하기</a></p>
                    `;
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
            <div id="map" class="rounded-lg border border-gray-300"></div>
            <ul id="places" class="mt-4 list-disc pl-5"></ul>
            <div id="place-details" class="mt-4"></div>
        </div>
    </div>
</body>
</html>
