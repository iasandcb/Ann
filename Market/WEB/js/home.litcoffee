# 브라우저

    define ['app', 'jquery'], (app, $) ->
        app.register.controller "HomeCtrl", ["$scope", "$window", "$location", "ezfb", "serviceModel", ($scope, $window, $location, ezfb, serviceModel) ->
            $('#homeMenu').addClass 'active'
            $('#tagMenu').removeClass 'active'
            $('#companyMenu').removeClass 'active'
            $('#serviceMenu').removeClass 'active'

            await serviceModel.findDataSet
                start: 0
                count: 4
                , defer result

            $scope.$apply ->
                $scope.todayTopServices = result.savedDataSet
                return

            return
        ]
        return
