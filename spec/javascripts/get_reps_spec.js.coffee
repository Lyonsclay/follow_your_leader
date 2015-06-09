#= require spec_helper
#= require sinon
#= require chai-as-promised
#= require_directory ../../app/assets/javascripts/services/get_reps/.

before ->
  json = "{ \"js\": \"OBJECT\" }"
  @json = json
  response = ->
    Promise.resolve(json)
    
  window.gapi = {}
  window.gapi.client = {}
  window.gapi.client.request = ->
    
  sinon.stub(gapi.client, "request", response)
  
  @address = "22 harbinger ln; Town Homes OK 21404"
  @responseObject = getReps(@address)
  
describe "getReps", ->
  it "returns a new Object", ->
    expect(@responseObject).to.be.instanceof(Object)

  describe "returned Object", ->
    it "is thenable", ->
      expect(@responseObject).to.have.property("then")
      .that.is.a("function") 

    it "resolves to a string", (done) ->
      expect(@responseObject).to.eventually.equal(@json)
      .and.notify(done)

