$:.unshift(File.dirname(__FILE__) + "/../lib")
require 'bench_press'

module ExistenceOfMethod
  extend BenchPress

  class A
    def c
    end
  end

  a = A.new

  measure('method_defined?') do
    A.method_defined? :c
  end
  measure('respond_to?') do
    a.respond_to? :c
  end
  measure('instance_methods include') do
    A.instance_methods.include? :c
  end
  measure('instance_methods(false) include') do
    A.instance_methods(false).include? :c
  end
end

puts ExistenceOfMethod.bench_press
