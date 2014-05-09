    define ['app', 'jquery'], (app, $) ->
        app.register.controller "ServiceCtrl", ["$scope", ($scope) ->
            $scope.getList = ->
                serviceModel = Market.ServiceModel()
                serviceModel.findDataSet {}, (result) ->
                    if result.hasError is false
                        $scope.services = result.savedDataSet
                        $scope.$apply()
                    return
                return

            $scope.register = ->
                serviceModel = Market.ServiceModel()
                await serviceModel.create
                    name: $scope.name
                    , defer result

                if result.hasError is false
                    $('#result').html('Registration is completed')
                    $scope.getList()

                return
            return
            ]
        return
