
@intArray = [1, 3, 4, 6, 3, 3]
@intArrayCopy = []
@intArrayDup = []
@intArrayCopyPtr = []
# copy @intArray into @intArrayCopy
@intArrayCopy = @intArray[0..@intArray.length]
# duplicate @intArray into @intArrayDup
@intArrayDup = @intArray.dup
# set @intArrayPtr to @intArrayCopy
@intArrayCopyPtr = @intArrayCopy
puts '@intArray = ' + @intArray.inspect
puts '@intArrayDup = ' + @intArrayDup.inspect
puts '@intArrayCopy = ' + @intArrayCopy.inspect
puts '@intArrayCopyPtr = ' + @intArrayCopyPtr.inspect
puts

# modify @intArrayCopy
@intArray[0] = 10
@intArrayCopy[0] = 3
puts '@intArray = ' + @intArray.inspect
puts '@intArrayDup = ' + @intArrayDup.inspect
puts '@intArrayCopy = ' + @intArrayCopy.inspect
puts '@intArrayCopyPtr = ' + @intArrayCopyPtr.inspect
puts
