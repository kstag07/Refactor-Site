class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments

  LANGUAGE_OPTIONS = {'C' => 'c',
                      'Clojure' => 'clojure',
                      'Coffee script' => 'coffeescript',
                      'Common Lisp' => 'common_lisp',
                      'C++' => 'cpp',
                      'C#' => 'csharp',
                      'CSS' => 'css',
                      'erb' => 'erb',
                      'Go' => 'go',
                      'Groovy' => 'groovy',
                      'HAML' => 'haml',
                      'Haskel' => 'haskel',
                      'HTML' => 'html',
                      'Java' => 'java',
                      'Javascript' => 'javascript',
                      'JSON' => 'json',
                      'MD' => 'markdown',
                      'Matlab'=> 'matlab',
                      'Objective C' => 'objective_c',
                      'Perl' => 'perl',
                      'PHP' => 'php',
                      'Plain Text' => 'plaintext',
                      'Prolog' => 'prolog',
                      'Puppet' => 'puppet',
                      'Python' => 'python',
                      'Racqet' => 'racket',
                      'Ruby' => 'ruby',
                      'Sass' => 'sass',
                      'Scala' => 'scala',
                      'Scheme' => 'scheme',
                      'Smalltalk' => 'smalltalk',
                      'SQL' => 'sql',
                      'Visual Basic' => 'vb',
                      'XML' => 'xml'}


  validates_inclusion_of :language, :in => LANGUAGE_OPTIONS

  def self.search(query)
    where("title like ?", "%#{query}%")
  end



end
