var annControllers = angular.module('annControllers', []);

annControllers.controller('MenuCtrl', function($scope, $materialSidenav, $timeout, menu) {
    $scope.menu = menu;
    $scope.toggleMenu = function() {
        $timeout(function() {
            $materialSidenav('left').toggle();
        });
    };
});

annControllers.controller('HomeCtrl', function($scope) {
    console.log('home');
});

annControllers.controller('CreationsCtrl', function($scope, $http) {
    responsePromise = $http.get('/creations');
    responsePromise.success(function(data, status, headers, config) {
        console.log(data);
        $scope.creations = data;
    });
});
