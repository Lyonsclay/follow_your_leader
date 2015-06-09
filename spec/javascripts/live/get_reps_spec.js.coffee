#= require spec_helper
#= require sinon
#= require chai-as-promised
#= require_directory ../../../vendor/assets/javascripts/.
#= require_directory ../../../app/assets/javascripts/services/get_reps/.

before ->
  @address = "22 harbinger ln; Town Homes OK 21404"
  @responseObject = getReps(@address)
  
describe "getReps", ->
  it "returns a new Object", ->
    expect(@responseObject).to.be.instanceof(Object)

  describe "returned Object", ->
    it "is thenable", ->
      expect(@responseObject).to.have.property("then")
      .that.is.a("function") 
