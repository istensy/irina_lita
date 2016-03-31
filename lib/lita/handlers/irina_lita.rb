require "oci8"

module Lita
  module Handlers
    class Irina < Handler
      # insert handler code here

      # config :username, required: true, type: String
      # config :password, required: true, type: String
      # config :site, required: true, type: String
      # config :context, required: false, type: String, default: ''
      # config :format, required: false, type: String, default: 'verbose'
      # config :ambient, required: false, types: [TrueClass, FalseClass], default: false
      # config :ignore, required: false, type: Array, default: []
      # config :rooms, required: false, type: Array
      # config :admins, required: false, type: Array
      # config :merdevl_user, required: false, type: String
      # config :merdevl_pwd, required: false, type: String
       config :oracle_auth, required: true, type: Hash
       route(
        /^dbstatus\s#{DBNAME_PATTERN}$/,
        :oracle,
        command: true,
        help: {
          "echo TEXT" => "Echoes back TEXT." 
        }
      )

      def oracle(response)
        puts "oracle dbname"
        #dbname = response.match_data['dbname']
        dbname = "MERDEVL2"
        #puts response.match_data['dbname']
        #puts config.oracle_auth
        #oracle = config.oracle_auth
        #puts oracle[dbname]
        #conn_parameter = "#{oracle[dbname]}@#{dbname}"
        #puts conn_parameter
        conn_parameter = "istensky/istensky123@#{dbname}"
        conn = OCI8.new(conn_parameter)
        plsql = conn.parse("begin :cst := f_tuning; end; ")
        plsql.bind_param(':cst', OCI8::Cursor)
        plsql.exec()
        cursor=plsql[':cst']
        plsql.close
        x = ''
        while r = cursor.fetch()
        x = x + r.join(', ') + "\n"
        end
        puts x
        response.reply(x)
        cursor.close()
      end
    end
    Lita.register_handler(irina)
  end
end
