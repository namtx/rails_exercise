namespace :import do
  desc "import developers with languages and programming_languages association"
  task developers: :environment do
    Rake::Task["import:languages"].invoke
    Rake::Task["import:programming_languages"].invoke

    languages = Language.all
    programming_language = ProgrammingLanguage.all

    100.times do |n|
      developer = Developer.create email: "sample_import+#{n}@sample.com"
      developer.languages << languages.sample(rand(3) + 1)
      developer.programming_languages << programming_language.sample(rand(3) + 1)
    end
  end

  desc "import languages"
  task languages: :environment do
    %w(en ja vi fr cn pl th).each do |code|
      Language.create code: code
    end
  end

  desc "import programming languages"
  task programming_languages: :environment do
    %w(java javascript ruby objective-c c-sharp rust php).each do |name|
      ProgrammingLanguage.create name: name
    end
  end
end
