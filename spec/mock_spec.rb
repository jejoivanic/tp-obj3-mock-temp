require_relative '../src/Mock'
require_relative '../example_domain/Pepita'
require 'rspec'

describe 'mocks' do

  let(:pepita) do
    Pepita.new
  end

  let(:pepitaMock) do
    Mock.mock(Pepita)
  end

  it 'deberia saber la interfaz de la clase mockeada' do
    expect(pepitaMock.mocked_method.size).to eq(Pepita.instance_methods.size)
  end

  it 'deberia poder mockear un metodo de la interfaz y hacer que devuelva el valor especificado' do
    pepitaMock.when(:puede_volar?).returns(true)
    expect(pepitaMock.respond_to?(:puede_volar?)).to be true
    expect(pepitaMock.puede_volar?).to be true

    pepitaMock.when(:puede_volar?).returns(false)
    expect(pepitaMock.respond_to?(:puede_volar?)).to be true
    expect(pepitaMock.puede_volar?).to be false
  end

  it 'deberia lanzar una excepcion si se desea mockear un metodo que no es propio de la interfaz' do
    expect{ pepitaMock.when(:foo).returns(true) }.to raise_error(NoMethodError)
  end

end