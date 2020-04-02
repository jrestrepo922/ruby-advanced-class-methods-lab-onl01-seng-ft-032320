

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new 
    @@all << song
    song
  end 
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song # this value is return so it can be iteract it with 
  end 
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song 
  end 
  
  def self.find_by_name(name)
    self.all.find{|song|
      song.name == name
    }
  end 
  
  def self.find_or_create_by_name(name)
    #ugly way to do it
    #truth_and_false_array = []

    #self.all.each { |song|
    #truth_and_false_array << song.name.include?(name)}
    
    #if truth_and_false_array.include?(true)
      
      #find_by_name(name)
      
    #else
      #create_by_name(name)
    #end 
    
    #elegant way to do it
    #This is going run the first method regardless and if that results in a falsey value then it'll run the method on the other side.
    
    find_by_name(name) || create_by_name(name)
  end 
  
  def self.alphabetical
    self.all.sort_by {|song| 
      song.name
    }
  end 
  
  def self.new_from_filename(filename)
    intermidiate_array = filename.split(/[-.]/)
    intermidiate_array.pop()
    normalized_array = intermidiate_array.collect {|element| element.strip}
    song = self.new #instance 
    song.name= normalized_array[1]
    song.artist_name= normalized_array[0]
    song
  end 
  
  def self.create_from_filename(filename)
    self.all << new_from_filename(filename)
  end 
end

