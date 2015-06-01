#= require spec_helper
#= require sinon
#= require chai-as-promised
#= require_directory ../../app/assets/javascripts/geolocation

describe "navigator", ->
  it "has access to navigator object", ->
    expect(navigator).to.be.instanceof(Object)

  it "has access to navigator.geolocation object", ->
    expect(navigator.geolocation).to.be.instanceof(Object)

  it "has acces to getCurrentPosition function", ->
    expect(navigator.geolocation.getCurrentPosition).to.be.instanceof(Function)

  it "can stub getCurrentPosition function", ->
    location = { longitude: 8.98908, latitude: 9.000234 } 
    locate = ->
      location 
    sinon.stub(navigator.geolocation, "getCurrentPosition", locate)
    expect(navigator.geolocation.getCurrentPosition()).to.equal(location)
 
describe "Geolocator", ->
  it "has a coordinates property", ->
    expect(Geolocator).to.have.property("coordinates") 
  
  describe ".coordinates", ->
    it "is a promise", ->
      expect(Geolocator.coordinates()).to.be.instanceof(Promise)
      
    it "has a then property", ->
      expect(Geolocator.coordinates()).to.have.property("then")
      .that.is.a("function")
  
    it "resolves", ->
      expect(Geolocator.coordinates()).to.resolve
  
    it "has a longitude property", ->
      expect(Geolocator.coordinates()).to.eventually.have.property("longitude")

      describe ".longitude", ->
        it "resolves to 8.98908", (done) ->
          expect(Geolocator.coordinates()).to.eventually.have.property("longitude")
          .and.equal(8.98908).notify(done)
