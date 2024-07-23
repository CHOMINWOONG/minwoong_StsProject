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
    <title>�ֺ� ������ ���� ã��</title>
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

                    // Google Maps �ʱ�ȭ
                    map = new google.maps.Map(document.getElementById('map'), {
                        center: userLocation,
                        zoom: 15
                    });

                    // ������� ��ġ�� ��Ŀ ǥ��
                    const marker = new google.maps.Marker({
                        position: userLocation,
                        map: map,
                        title: "Your location"
                    });

                    service = new google.maps.places.PlacesService(map);
                    infowindow = new google.maps.InfoWindow();

                    // �ֺ� ������ ���� �˻�
                    searchNearby(userLocation);
                }, function() {
                    alert('��ġ ������ ����� �� �����ϴ�.');
                });
            } else {
                alert('�� �������� ��ġ ������ �������� �ʽ��ϴ�.');
            }
        }

        function searchNearby(location) {
            const request = {
                location: location,
                radius: '5000',
                type: ['restaurant'],
                keyword: '������'
            };

            service.nearbySearch(request, function(results, status) {
                if (status === google.maps.places.PlacesServiceStatus.OK) {
                    displayResults(results);
                    for (let i = 0; i < results.length; i++) {
                        createMarker(results[i]);
                    }
                } else {
                    alert('�ֺ� ������ ���Ը� ã�� �� �����ϴ�.');
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
                        websiteHtml = '<p><a href="' + place.website + '" target="_blank">������Ʈ �湮�ϱ�</a></p>'; // ������ �κ�: ���ڿ� ���� ���
                    }

                    // ������ �κ�: ���ڿ� ������ ���� HTML�� �������� ����
                    details.innerHTML = 
                        '<h2>' + place.name + '</h2>' +
                        '<p>�ּ�: ' + place.formatted_address + '</p>' +
                        '<p>��ȭ��ȣ: ' + (place.formatted_phone_number || '���� ����') + '</p>' + // ������ �κ�: ��ȭ��ȣ�� ���� ��� '���� ����' ǥ��
                        websiteHtml; // ������ �κ�: ������Ʈ ��ũ �߰�
                } else {
                    alert('���� ���� ������ ������ �� �����ϴ�.');
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
                        alert('�˻� ����� �����ϴ�.');
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
            <h1 class="text-2xl font-bold mb-6 text-center">�ֺ� ������ ���� ã��</h1>
            <div class="flex justify-center mb-4">
                <input id="searchKeyword" type="text" placeholder="�˻�� �Է��ϼ���" class="border border-gray-400 p-2 rounded-l-lg w-full max-w-md">
                <button onclick="performSearch()" class="bg-blue-500 text-white p-2 rounded-r-lg">�˻�</button>
            </div>
            <div class="flex">
                <div id="map" class="rounded-lg border border-gray-300 flex-grow"></div>
                <div class="flex flex-col ml-4 w-1/3">
                	<h2 class="text-xl font-bold mt-4 text-center">�ֺ� ��������</h2>
                    <div id="places" class="mt-4 list-disc pl-5 border border-green-500  border-y-0 p-4 overflow-auto"></div>
                    <div id="place-details" class="mt-4 p-4 border border-gray-300 rounded-md"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
