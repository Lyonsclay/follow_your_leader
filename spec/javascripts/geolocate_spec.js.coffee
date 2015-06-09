#= require spec_helper
#= require sinon
#= require chai-as-promised
#= require_directory ../../app/assets/javascripts/services/geolocation/.

before ->
  location = coords: { longitude: 8.98908, latitude: 9.000234 }
  resolve = ->
  locate = (resolve) ->
    resolve(location)

  sinon.stub(navigator.geolocation, "getCurrentPosition", locate)
  @location = location
  
describe "getPosition", ->
  it "returns a promise", ->
    expect(getPosition()).to.be.instanceof(Promise) 
  
  it "resolves to a object", (done) ->
    expect(getPosition()).to.eventually.be.instanceof(Object)
    .with.property("coords")
    .and.notify(done)
    
describe "getCoords", ->
  it "returns a promise", ->
    expect(getCoords(@location)).to.be.instanceof(Promise)
    
  describe ".longitude", ->
    it "resolves to 8.98908", (done) ->
      expect(getCoords(@location)).to.eventually.have.property("longitude")
      .and.equal(8.98908).notify(done)

describe "geolocate", ->
  it "returns a promise", ->
    expect(geolocate()).to.be.instanceof(Promise)

  it "resolves to an object", (done) ->
    expect(geolocate()).to.eventually.be.instanceof(Object)
    .and.notify(done)

  it "has access to longitude", (done) ->
    expect(geolocate()).to.eventually.have.property("longitude")
    .and.equal(8.98908).notify(done)
