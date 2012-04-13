module ChefHelper
  require 'chef/shef'

  Chef::Log.level = :info

  def session
    Shef.session
  end

  def run_chef
    session.rebuild_collection
    Chef::Runner.new(session.node, session.collection, session.definitions, session.cookbook_loader).converge
  end

  def method_missing(method_symbol, *args, &block)
    begin
      session.recipe.send(method_symbol, args, &block)
      run_chef
    rescue Exception => e
      puts "We are sorry but something went wrong: #{e}"
      exit
    end
  end
end