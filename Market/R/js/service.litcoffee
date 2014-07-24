    define ['app', 'jquery'], (app, $) ->
        app.controller "ServiceCtrl", ["$scope", "serviceModel", "tagModel", ($scope, serviceModel, tagModel) ->
            # $('body').css({'background-color': 'black'})
            $('#serviceMenu').addClass 'active'
            $('#companyMenu').removeClass 'active'
            $('#tagMenu').removeClass 'active'
            $('#homeMenu').removeClass 'active'

            $scope.getList = ->
                console.log serviceModel
                
                console.log serviceModel.find
                serviceModel.find {},
                    success: (result) ->
                        console.log 'result', result
                        $scope.$apply ->
                            $scope.services = result
                            return
                        return

                    notValid: (message) ->
                        console.log 'not valid', message
                        return

                    error: (message) ->
                        console.log 'error', message
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
                        if result?
                            tagId = result.id
                            tagIds.push tagId
                        else
                            tagModel.create {name: tag}, (result) ->
                                tagId = result.id
                                tagIds.push tagId
                                return
                        return

태그를 수정할 수도 있을 것이다.

                serviceModel.create
                    name: $scope.name
                    description: $scope.description
                    tags: tagIds
                    , (result) ->
                        $scope.showForm = false
                        $('#result').html('Registration is completed')
                        $scope.getList()
                        return

                return

            return
            ]
        return
