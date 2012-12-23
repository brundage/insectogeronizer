class RestfulController < ApplicationController

#  before_filter :set_record

  respond_to :html, :js

  ACTIONS = %w( create delete edit index new show update )

  def self.actions; ACTIONS; end


  def create
  end


  def delete
  end


  def edit
    respond_with record
  end


  def index
    respond_with record
  end


  def new
    render(:edit) && return
  end


  def show
  end


  def update
    if record.update_attributes model_params
      redirect_to after_successful_update
    else 
      render(:edit) && return
    end
  end

private

  actions.each do |action|
    module_eval %Q-
                  def #{action}?
                    !! action_name && action_name == #{action}
                  end
                -
  end


  def after_successful_update
    model.name.underscore.pluralize + '_url'
  end


  def find
    index? ? finder.find_many : finder.find_one
  end


  def finder
    @finder ||= Finder.new controller: self, model: model
  end


  def ivar_name
    name = index? ? model.name.pluralize : model.name.singularize
    "@#{name.underscore}"
  end


  def model
    @model ||= self.class.name.sub(/Controller$/,'').classify.constantize
  end


  def model_params
    params[model.name.underscore.to_sym]
  end


  def record
    @record ||= set_record
  end


  def set_record
    if create?
      instance_variable_set ivar_name, model.create(model_params)
    elsif new?
      instance_variable_set ivar_name, model.new(model_params)
    else
      instance_variable_set ivar_name, find
    end
  end


  class Finder

    attr_accessor :controller, :decorator, :model

    def initialize(args={})
      self.controller = args[:controller]
      raise ArgumentError.new('Must provide a controller') unless controller
      self.model = args[:model]
      raise ArgumentError.new('Must provide a model') unless model
      self.decorator = args[:decorator] || figure_decorator
    end


    def find(args={})
      if args[:decorate] && decorator
        decorator.decorate yield
      else
        yield
      end
    end


    def find_many(args={})
      find(args) { model.all }
    end


    def find_one(args={})
puts "params #{controller.params}"
      find(args) { model.find(controller.params[:id]) }
    end

  private

    def figure_decorator
      const = "#{model.name}Decorator"
      self.class.const_defined?(const) ? const.constantize : nil
    end

  end
end
