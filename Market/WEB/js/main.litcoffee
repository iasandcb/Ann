    require.config
        baseUrl: "js"
        paths:
            'angular': 'https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-beta.11/angular.min'
            'angular-route': 'https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-beta.11/angular-route.min'
            'angularAMD': '../lib/requirejs/angularAMD'
            'ngload': '../lib/requirejs/ngload'
            'ui-bootstrap': '../lib/angular-ui-bootstrap/ui-bootstrap-tpls'
            'bootflat': '../lib/site.min'
            'jquery': 'http://code.jquery.com/jquery-1.11.1.min'
            'jquery.bootstrap': 'http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min'
            'ezfb': 'http://pc035860.github.io/angular-easyfb/angular-easyfb.min'
            'async': '../lib/async'

            'HomeCtrl': 'home'
            'CompanyCtrl': 'company'
            'ServiceCtrl': 'service'
            'ServiceDetailCtrl': 'service-detail'
            'TagCtrl': 'tag'

        shim:
            'angularAMD': ['angular']
            'angular-route': ['angular']
            'ui-bootstrap': ['angular']
            'ezfb': ['angular']
            'jquery.bootstrap': ['jquery']
            'bootflat': ['jquery.bootstrap']

        deps: ['app']
