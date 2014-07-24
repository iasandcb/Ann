    require.config
        baseUrl: "js"
        paths:
            'angular': 'https://ajax.googleapis.com/ajax/libs/angularjs/1.2.20/angular.min'
            'angular-route': 'https://ajax.googleapis.com/ajax/libs/angularjs/1.2.20/angular-route.min'
            'angularAMD': '../lib/requirejs/angularAMD'
            'ngload': '../lib/requirejs/ngload'
            'ui-bootstrap': '../lib/angular-ui-bootstrap/ui-bootstrap-tpls'
            'bootflat': '../lib/site.min'
            'jquery': 'http://code.jquery.com/jquery-1.11.1.min'
            'jquery.bootstrap': 'http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min'
            'ezfb': 'http://pc035860.github.io/angular-easyfb/angular-easyfb.min'
            'async': '../lib/async'
            'ngStorage': '../lib/ngStorage.min'

            'HomeCtrl': 'home'
            'CompanyCtrl': 'company'
            'ServiceCtrl': 'service'
            'ServiceDetailCtrl': 'service-detail'
            'TagCtrl': 'tag'

        shim:
            'angularAMD': ['angular']
            'ngload': ['angularAMD']
            'angular-route': ['angular']
            'ui-bootstrap': ['angular']
            'ezfb': ['angular']
            'ngStorage': ['angular']
            'jquery.bootstrap': ['jquery']
            'bootflat': ['jquery.bootstrap']

        deps: ['app']
