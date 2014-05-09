    define ['app', 'jquery'], (app, $) ->
        app.register.controller "ServiceDetailCtrl", ["$scope", "$routeParams", "serviceModel", "commentModel", ($scope, $routeParams, serviceModel, commentModel) ->
            await serviceModel.getData $routeParams['id'], defer result
            console.log result
            $scope.$apply ->
                $scope.service = result.savedData
                return

            $scope.getList = ->
                console.log 'sss'
                commentModel.findDataSet {filter: {service: $scope.service.id}}, (result) ->
                    console.log result
                    if result.hasError is false
                        $scope.$apply ->
                            $scope.comments = result.savedDataSet
                            return
                    return
                return

            $scope.getList()

            $scope.register = ->
                await commentModel.create
                    author: $scope.author
                    content: $scope.content
                    service: $scope.service.id
                    , defer result

                if result.hasError is false
                    $('#result').html('Registration is completed')
                    $scope.author = $scope.content = ''
                    $scope.getList()

                return
            return
            ]
        return
