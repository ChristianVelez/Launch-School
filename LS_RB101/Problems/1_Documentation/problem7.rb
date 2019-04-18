=begin

The public_methods method takes an optional argument that can be 
set to false and if omitted, is assumed to be true.

While set to true, it will list all methods publicly available to 
the class of the caller along with the superclass and above (Object, Kernel, etc). 
So in order to strip out all the public methods for the super class, we need to set 
the parameter to false, which will give us only the public methods available to 
the String class.

Like so:

=end

s = 'abc'
puts s.public_methods(false).inspect