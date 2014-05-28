class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :comments

  LANGUAGE_OPTIONS = {'c' => 'C',
                      'clojure' => 'Clojure',
                      'coffeescript' => 'Coffee Ccript',
                      'common_lisp' => 'Common Lisp',
                      'cpp' => 'C++',
                      'csharp' => 'C#',
                      'css' => 'CSS',
                      'erb' => 'Embedded Ruby',
                      'go' => 'Go',
                      'groovy' => 'Groovy',
                      'haml' => 'HAML',
                      'haskel' => 'Haskel',
                      'html' => 'HTML',
                      'java' => 'Java',
                      'javascript' => 'Javascript',
                      'json' => 'JSON',
                      'markdown' => 'Markdown',
                      'matlab'=> 'Matlab',
                      'objective_c' => 'Objective C',
                      'perl' => 'Perl',
                      'php' => 'PHP',
                      'plaintext' => 'Plain Text',
                      'prolog' => 'Prolog',
                      'puppet' => 'Puppet',
                      'python' => 'Python',
                      'racket' => 'Racket',
                      'ruby' => 'Ruby',
                      'sass' => 'Sass',
                      'scala' => 'Scala',
                      'scheme' => 'Scheme',
                      'smalltalk' => 'Smalltalk',
                      'sql' => 'SQL',
                      'vb' => 'Visual Basic',
                      'xml' => 'XML'}

  validates_inclusion_of :language, :in => LANGUAGE_OPTIONS

  def self.search(query)
    where("title like ?", "%#{query}%")
  end
end
