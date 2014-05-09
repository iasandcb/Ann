    iced =
        Deferrals : class
            constructor: (@continuation) ->
                @count = 1
                @ret = null
            _fulfill : ->
                @continuation @ret if not --@count
            defer : (defer_params) ->
                @count++
                (inner_params...) =>
                    defer_params?.assign_fn?.apply(null, inner_params)
                    @_fulfill()
        findDeferral : (args) -> null
        trampoline : (fn) -> fn()

    define [
        "angularAMD"
        "angular-route"
        "ezfb"
    ], (angularAMD) ->
        app = angular.module("ngreq-app", ["ngRoute", 'ezfb'])
        app.factory 'companyModel', ->
            Market.CompanyModel()

        app.factory 'serviceModel', ->
            Market.ServiceModel()

        app.factory 'commentModel', ->
            Market.CommentModel()

        app.config (ezfbProvider) ->
            ezfbProvider.setInitParams
                appId: '217817081761575'

            return

        app.config [
            "$routeProvider"
            ($routeProvider) ->
                $routeProvider.when("/home", angularAMD.route(
                    templateUrl: "home.html"
                    controller: "HomeCtrl"
                )).when("/company", angularAMD.route(
                    templateUrl: "company.html"
                    controller: "CompanyCtrl"
                )).when("/service", angularAMD.route(
                    templateUrl: "service.html"
                    controller: "ServiceCtrl"
                )).when("/service/:id", angularAMD.route(
                    templateUrl: "service-detail.html"
                    controller: "ServiceDetailCtrl"
                )).otherwise redirectTo: "/home"
            ]

      # Define constant to be used by Google Analytics
        app.constant "SiteName", "/angularAMD"

      # Create function to link to GitHub
      # Bootstrap Angular when DOM is ready
        angularAMD.bootstrap app
        app
