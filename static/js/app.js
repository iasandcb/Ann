var annApp = angular.module('annApp', ['ngMaterial', 'ngRoute', 'ngTouch', 'annControllers']);

annApp.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider.
        when('/home', {
            templateUrl: 'home.html',
            controller: 'HomeCtrl'
        }).
        when('/creations', {
            templateUrl: 'creations.html',
            controller: 'CreationsCtrl'
        }).
        otherwise({
            redirectTo: '/home'
        });
 }]);

annApp.factory('menu', function($location, $rootScope) {
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
    var self;
    $rootScope.$on('$locationChangeSuccess', onLocationChange);
    return self = {sections: sections,
        isSectionSelected: function(section) {
            return self.openedSection === section;
        },
        selectSection: function(section) {
            self.openedSection = section;
            $location.path(section.name);
        }
    };

    function onLocationChange() {
        var activated = false;
        var path = $location.path();
        console.log(path);
        sections.forEach(function(section) {
            if (path.substring(1) === section.name) {
                self.selectSection(section);
                activated = true;
            }
        });
        if (!activated) {
            self.selectSection(sections[0]);
        }
    }
});
