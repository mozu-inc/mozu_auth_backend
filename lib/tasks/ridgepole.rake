# frozen_string_literal: true

namespace :ridgepole do
  desc 'ridgepole --apply'
  task apply: :environment do
    include RidgepoleHelper

    ridgepole! '--apply'
    Rake::Task['db:schema:dump'].invoke
    Rake::Task['annotate_models'].invoke if Rails.env.development?
    # Rake::Task['annotate_routes'].invoke if Rails.env.development?
    Rails.logger.info 'ridgepole done.'
  end

  desc 'ridgepole --apply --dry-run'
  namespace :apply do
    desc 'ridegpole dry run'
    task 'dry-run' => :environment do
      include RidgepoleHelper

      ridgepole! '--apply', '--dry-run'
    end
  end
end

module RidgepoleHelper
  def schemafile
    Rails.root.join('Schemafile')
  end

  def configfile
    Rails.root.join('config/database.yml')
  end

  def ridgepole!(*args)
    system "bundle exec ridgepole #{[options + args].join(' ')}"
  end

  def options
    [
      "-E #{Rails.env}",
      "-c #{configfile}",
      "-f #{schemafile}"
    ]
  end
end
