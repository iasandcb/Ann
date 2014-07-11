    define ['app', 'jquery'], (app, $) ->
        app.controller "ServiceCtrl", ["$scope", "serviceModel", "tagModel", ($scope, serviceModel, tagModel) ->
            # $('body').css({'background-color': 'black'})
            $('#serviceMenu').addClass 'active'
            $('#companyMenu').removeClass 'active'
            $('#tagMenu').removeClass 'active'
            $('#homeMenu').removeClass 'active'

            $scope.getList = ->
                serviceModel.find {}, (result) ->
                    if result.hasError is false
                        $scope.$apply ->
                            $scope.services = result.savedDataSet
                            return
                    return
                return

            $scope.getList()

            $scope.register = ->

태그를 넣어준다.

                tags = []

                if $scope.tags?
                    tags = $scope.tags.split ','

                tagIds = []
                console.log tags
                for tag in tags
                    tagModel.get {filter:{name: tag}}, (result) ->
                        if result.savedData?
                            tagId = result.savedData.id
                            tagIds.push tagId
                        else
                            tagModel.create {name: tag}, (result) ->
                                tagId = result.savedData.id
                                tagIds.push tagId
                                return
                        return

태그를 수정할 수도 있을 것이다.

                serviceModel.create
                    name: $scope.name
                    description: $scope.description
                    tags: tagIds
                    , (result) ->
                        if result.hasError is false
                            $scope.showForm = false
                            $('#result').html('Registration is completed')
                            $scope.getList()
                        return

                return

            return
            ]
        return
