# 브라우저

    define ['app', 'jquery'], (app, $) ->
        app.register.controller "HomeCtrl", ["$scope", "$window", "$location", "ezfb", ($scope, $window, $location, ezfb) ->
            $('#homeMenu').addClass 'active'
            $('#tagMenu').removeClass 'active'
            $('#companyMenu').removeClass 'active'
            $('#serviceMenu').removeClass 'active'

            return
        ]
        return
