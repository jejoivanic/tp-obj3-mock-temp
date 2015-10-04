require_relative '../src/Mock'
require_relative '../spec_domain/Pepita'
require 'rspec'

describe 'mocks' do

  let(:pepita) do
    Pepita.new
  end

  let(:pepitaMock) do
    Mock.mock(Pepita)
  end

  it 'deberia poder mockear un metodo de la interfaz y hacer que devuelva el valor especificado' do
    pepitaMock.when(:puede_volar?).returns(true)
    expect(pepitaMock.puede_volar?).to be true

    pepitaMock.when(:puede_volar?).returns(false)
    expect(pepitaMock.puede_volar?).to be false
  end

  it 'deberia lanzar una excepcion si se desea mockear un metodo que no es propio de la interfaz' do
    expect{ pepitaMock.when(:foo).returns(true) }.to raise_error(NoMethodError)
  end

  it 'deberia lanzar una excepcion al utilizar los metodos #with o #return en el lugar incorrecto' do
    expect{ pepitaMock.with(true) }.to raise_error('#when method missed!')
    expect{ pepitaMock.returns(true) }.to raise_error('#when method missed!')
  end

  it 'deberia poder mockear un metodo de la interfaz con un parametro y hacer que devuelva el valor especificado
      para cuando se invoque dicho metodo con el mismo parametro' do
    pepitaMock.when(:puede_gastar?).with(10).returns(true)
    pepitaMock.when(:puede_gastar?).with(20).returns(false)

    expect( pepitaMock.puede_gastar?(10) ).to be true
    expect( pepitaMock.puede_gastar?(20) ).to be false
  end

end