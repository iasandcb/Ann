var annApp = angular.module('annApp', ['ngMaterial', 'ngRoute', 'ngTouch', 'annControllers']);

annApp.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
        when('/home', {
            templateUrl: 'home.html',
            controller: 'HomeCtrl'
        }).
        otherwise({
            redirectTo: '/home'
        });
 }]);

annApp.factory('menu', function() {
    var sections = [
    {
        name: 'creations'
    },
    {
        name: 'creators'
    },
    {
        name: 'tags'
    },
    {
        name: 'profile'
    }
    ];
});
