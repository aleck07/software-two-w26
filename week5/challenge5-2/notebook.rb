require_relative "database.rb"

class FakeDatabase
  def initialize
    @records = []
  end

  def append(record)
    @records << record
  end

  def record_count
    @records.length
  end

  def record_get_all
    @records
  end
end

class Notebook
  attr_reader :name

  def initialize(name)
    @name = name
    @db = FakeDatabase.new
  end

  def add_entry(entry)
    @db.append(entry)
  end
  
  def count_entries
    @db.record_count
  end

  def get_entry(n)
    all_entries = @db.record_get_all
    all_entries[n]
  end
end

