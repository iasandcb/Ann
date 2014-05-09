# 브라우저

    define ['app'], (app) ->
        app.register.controller "HomeCtrl", ["$scope", "$window", "$location", "ezfb", ($scope, $window, $location, ezfb) ->
            updateLoginStatus = (more) ->
                ezfb.getLoginStatus (res) ->
                    $scope.loginStatus = res
                    (more || angular.noop)()
                    return
                return

            updateApiMe = ->
                console.log 'me'
                return

            updateLoginStatus updateApiMe

            $scope.login = ->
                ezfb.login (res) ->
                    if res.authResponse
                        updateLoginStatus updateApiMe
                    return
                return

            $scope.logout = ->
                ezfb.logout ->
                    updateLoginStatus updateApiMe
                    console.log 'out'
                    return
                return

            return
        ]
        return
