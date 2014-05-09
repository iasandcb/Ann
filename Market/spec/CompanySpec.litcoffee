    describe "Company suite", ->
        it "should ", ->
            companyModel = Market.CompanyModel()
            await companyModel.create {name: 'cdb'}, defer result
            console.log result
            expect(true).toBe true
            return
        return
