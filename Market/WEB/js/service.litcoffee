    define ['app', 'jquery'], (app, $) ->
        app.register.controller "ServiceCtrl", ["$scope", "serviceModel", "tagModel", ($scope, serviceModel, tagModel) ->
            # $('body').css({'background-color': 'black'})
            $('#serviceMenu').addClass 'active'
            $('#companyMenu').removeClass 'active'
            $scope.getList = ->
                serviceModel.findDataSet {}, (result) ->
                    if result.hasError is false
                        $scope.services = result.savedDataSet
                        $scope.$apply()
                    return
                return

            $scope.register = ->

태그를 넣어준다.

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
                    tags: tagIds
                    , defer result

                if result.hasError is false
                    $('#result').html('Registration is completed')
                    $scope.getList()

                return
            return
            ]
        return
