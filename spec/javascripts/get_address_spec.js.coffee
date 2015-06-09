#= require spec_helper
#= require sinon
#= require chai-as-promised
#= require_directory ../../app/assets/javascripts/services/get_address/.

beforeEach ->
  newLatLng = ->
    window.google.maps.LatLng = ->
    coordinateObject = ->
        { coords: [0, 1] }
  
    sinon.stub(google.maps, "LatLng", coordinateObject)      

  newGeocoder = ->
    window.google.maps.Geocoder = ->
    okGeocoder = ->
      geocode: (setting, callback) ->
        results = [{ formatted_address: "Goofy Boots" }]
        status = 'OK'
        callback(results, status)

    sinon.stub(google.maps, "Geocoder", okGeocoder)
 
  newGeocoder()
  @newGeocoder = new google.maps.Geocoder()
  newLatLng()
  @newLatLng = new google.maps.LatLng()
  
describe "google.maps", ->
  window.google = {}
  window.google.maps = {}
    
  describe "new Geocoder()", ->
    it "is a constructor", ->
      expect(@newGeocoder).to.be.instanceof(Object)
      
    it "has a geocode method", ->
      expect(@newGeocoder.geocode).to.be.instanceof(Function)
  
  describe "new LatLng", ->
    it "is a constructor", ->
      expect(@newLatLng).to.deep.equal({ coords: [0, 1] })
        
describe "geAddress", ->
  before ->
    location = 
      longitude: 9.89080,
      latitude: 8.03453
       
  it "can return a promise", ->
    expect(getAddress(location)).to.be.instanceof(Promise)

  it "calls resolve", ->
    resolve = sinon.spy(resolve)
    getAddress(location)
    expect(resolve).to.be.called
    expect(resolve).to.be.instanceof(Function)
    
  it "resolves with a value", (done) ->
    expect(getAddress(location)).to.eventually.equal("Goofy Boots")
    .and.notify(done)
