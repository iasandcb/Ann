    define ['app', 'jquery', 'jquery.bootstrap', 'bootflat', 'ui-bootstrap'], (app, $) ->
        app.register.controller "ServiceDetailCtrl", ["$scope", "$routeParams", "serviceModel", "commentModel", ($scope, $routeParams, serviceModel, commentModel) ->
            getList = ->
                commentModel.find {filter: {service: $scope.service.id}}, (result) ->
                    console.log result
                    if result.hasError is false
                        $scope.$apply ->
                            $scope.comments = result.savedDataSet
                            return
                    return
                return

            serviceModel.get $routeParams['id'], (result) ->
                console.log result
                $scope.$apply ->
                    $scope.service = result.savedData
                    getList()
                    return
                return

            $scope.register = ->
                commentModel.create
                    author: $scope.author
                    content: $scope.content
                    service: $scope.service.id
                    , (result) ->
                        if result.hasError is false
                            $('#result').html('Registration is completed')
                            $scope.author = $scope.content = ''
                            getList()

                        return
                return

            return
            ]
        return
