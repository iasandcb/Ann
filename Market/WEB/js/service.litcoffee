    define ['app', 'jquery'], (app, $) ->
        app.register.controller "ServiceCtrl", ["$scope", "serviceModel", "tagModel", ($scope, serviceModel, tagModel) ->
            # $('body').css({'background-color': 'black'})
            $('#serviceMenu').addClass 'active'
            $('#companyMenu').removeClass 'active'
            $('#tagMenu').removeClass 'active'
            $('#homeMenu').removeClass 'active'

            $scope.getList = ->
                await serviceModel.findDataSet {}, defer result
                if result.hasError is false
                    $scope.$apply ->
                        $scope.services = result.savedDataSet
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
                    await tagModel.findData {name: tag}, defer tResult
                    if tResult.savedData?
                        tagId = tResult.savedData.id
                    else
                        await tagModel.create {name: tag}, defer cResult
                        tagId = cResult.savedData.id
                    tagIds.push tagId

태그를 수정할 수도 있을 것이다.

                await serviceModel.create
                    name: $scope.name
                    description: $scope.description
                    tags: tagIds
                    , defer result

                if result.hasError is false
                    $scope.showForm = false
                    $('#result').html('Registration is completed')
                    $scope.getList()

                return
            return
            ]
        return
