    define ['app', 'jquery', 'jquery.bootstrap', 'bootflat', 'ui-bootstrap'], (app, $) ->
        app.controller "ServiceDetailCtrl", ["$scope", "$routeParams", "$sessionStorage", "serviceModel", "commentModel", ($scope, $routeParams, $sessionStorage, serviceModel, commentModel) ->
            console.log $sessionStorage.me
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
                    authorId: $sessionStorage.me.id
                    authorName: $sessionStorage.me.name
                    content: $scope.content
                    service: $scope.service.id
                    , (result) ->
                        if result.hasError is false
                            $scope.result = 'Registration is completed'
                            $scope.author = $scope.content = ''
                            getList()

                        return
                return

            return
            ]
        return
