#### Question 1
# Replace the comment below with a single line of code that will set the
# robot's online status to `true` and correctly output the debugging string.

class Robot
  def online=(value)
    debug_output("online status: #{value}")
    @online = value
  end

  def activate
    online(true)
  end
end


#### Question 2
# Given the following class, write code that would create a single robot and
# deactivate it. Then write code that would deactivate all robots. Do not change
# the class definition -- assume the methods do what they say.

class Robot
  def deactivate
    # ...
  end

  def self.deactivate_all
    # ...
  end
end

Robot.new.deactivate
Robot.deactivate_all


#### Question 3
# Write a module called `Speech` and add an instance method called `say` to it
# (no code needed in this method). Then add code to the Human and Robot classes
# that will allow them to use the `say` method.

module Speech
  def say(msg)
  end
end

class Human
  include Speech
  def chat
    say('How about that weather?')
  end
end

class Robot
  include Speech
  def chat
    say('Small talk program not installed.')
  end
end


#### Question 4
# Replace the comment below with code that will raise a Robot::ImmobileError
# when `move` is called on a robot that has no legs and no wheels.

class Robot
  class ImmobileError < StandardError; end

  def initialize(legs: 0, wheels: 0)
    @legs, @wheels = legs, wheels
  end

  def move(target)
    if @legs == 0 && @wheels == 0
      raise ImmobileError
    # else move
    end
  end
end


#### Question 5
# Modify the `qualified?` method below so that it returns `true` if the robot
# passed into it can move and `false` otherwise. Assume the `move` method will
# raise a Robot::ImmobileError if the robot cannot move.

class RobotRace
  def qualified?(robot)
    qualified = true
    begin
      robot.move
    rescue Robot::ImmobileError
      qualified = false
    end
    qualified
  end
end


#### Bonus Question
# Copy and paste the classes from questions 4 and 5 here, then modify them so
# the qualification check can be done without having to rescue an error. In the
# real world this approach is preferred, if we have control over both classes.

class Robot
  class ImmobileError < StandardError; end

  def initialize(legs: 0, wheels: 0)
    @legs, @wheels = legs, wheels
  end

  def move(target)
    if @legs == 0 && @wheels == 0
      false
    #else move and return true or truthy value
    end
  end
end

class RobotRace
  def qualified?(robot)
    # will either be false, or some 'truthy' value
    robot.move(no_real_target)
  end
end
