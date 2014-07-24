    define ['app', 'jquery', 'jquery.bootstrap', 'bootflat', 'ui-bootstrap'], (app, $) ->
        app.controller "ServiceDetailCtrl", ["$scope", "$routeParams", "$sessionStorage", "utils", "serviceModel", "commentModel", ($scope, $routeParams, $sessionStorage, utils, serviceModel, commentModel) ->
            console.log $sessionStorage.me
            utils.injectScope $scope, commentModel, serviceModel
            commentModel.scope = $scope
            serviceModel.scope = $scope
            getList = ->
                commentModel.find {filter: {service: $scope.service.id}}, (result) ->
                    console.log result
                    $scope.comments = result
                    return
                return

            serviceModel.get $routeParams['id'], (result) ->
                $scope.service = result
                getList()
                return

            $scope.register = ->
                commentModel.create
                    authorId: $sessionStorage.me.id
                    authorName: $sessionStorage.me.name
                    content: $scope.content
                    service: $scope.service.id
                    , (result) ->
                        $scope.result = 'Registration is completed'
                        $scope.author = $scope.content = ''
                        getList()
                        return
                return

            return
            ]
        return
