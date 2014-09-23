var annControllers = angular.module('annControllers', []);

annControllers.controller('HomeCtrl', function($scope) {
    console.log('home');
});

annControllers.controller('ServicesCtrl', function($scope, $http) {
    responsePromise = $http.get('/services');
    responsePromise.success(function(data, status, headers, config) {
        console.log(data);
        $scope.services = data;
    });
});
