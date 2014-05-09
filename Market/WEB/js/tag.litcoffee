    define ['app', 'jquery'], (app, $) ->
        app.register.controller "TagCtrl", ["$scope", "serviceModel", "tagModel", ($scope, serviceModel, tagModel) ->
            # $('body').css({'background-color': 'black'})
인기있는 태그들은 더 크게 나오게도 할 수 있다.(또는 우선 순위) 인기도를 조작할 수 있다.

            $scope.getList = ->
                await tagModel.findDataSet {sort: {popularity: -1}}, defer result
                if result.savedDataSet?
                    $scope.$apply ->
                        $scope.tags = result.savedDataSet
                        return
                return

            $scope.chooseTag = ($event, tag) ->
                $event.preventDefault()
                targetButton = $($event.target)
                console.log targetButton
                targetButton.toggleClass 'active'
                console.log targetButton.hasClass 'active'

태그를 넣어준다. 태그를 여러개 체크할 수 있게 한다.

                await serviceModel.findDataSet
                    filter:
                        tags: {$in: [tag.id]}
                    , defer result

                if result.savedDataSet?
                    $scope.$apply ->
                        $scope.services = result.savedDataSet
                        return

                return
            return
            ]
        return
