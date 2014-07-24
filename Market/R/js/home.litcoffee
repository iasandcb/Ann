# 브라우저

    define ['app', 'jquery'], (app, $) ->
        app.controller "HomeCtrl", ["$scope", "$window", "$location", "$q", "ezfb", "serviceModel", ($scope, $window, $location, $q, ezfb, serviceModel) ->
            $('#homeMenu').addClass 'active'
            $('#tagMenu').removeClass 'active'
            $('#companyMenu').removeClass 'active'
            $('#serviceMenu').removeClass 'active'

            serviceModel.find
                start: 0
                count: 4
                , (result) ->
                    $scope.$apply ->
                        $scope.todayTopServices = result.savedDataSet
                        return
                    return

            return
        ]
        return
