    require.config
        baseUrl: "js"
        paths:
            'angular': 'https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-beta.7/angular.min'
            'angular-route': 'https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-beta.7/angular-route.min'
            'async': '../lib/requirejs/async'
            'angularAMD': '../lib/requirejs/angularAMD'
            'ngload': '../lib/requirejs/ngload'
            'jquery': 'http://code.jquery.com/jquery-1.11.0.min'
            'jquery.bootstrap': 'http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js'
            'ezfb': 'http://pc035860.github.io/angular-easyfb/angular-easyfb.min'

            'HomeCtrl': 'home'
            'CompanyCtrl': 'company'
            'ServiceCtrl': 'service'
            'ServiceDetailCtrl': 'service-detail'

        shim:
            'angularAMD': ['angular']
            'angular-route': ['angular']
            'ezfb': ['angular']
            'jquery.bootstrap': ['jquery']

        deps: ['app']
