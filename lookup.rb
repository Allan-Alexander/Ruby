


# Function to check whether the domain name was entered in CMD
def get_command_line_argument
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <Domain>"
    exit
  end
  ARGV.first
end

# To get the domain name from CMD
domain = get_command_line_argument

# Read from a file, returns a array of strings
dns_raw = File.readlines('zone')

# ********* Start *********

# Code for the functions goes here
# Define functions parse_dns
def parse_dns(nodeList)
  find_if_exists = 0
  domain = Hash.new{|hsh,key| hsh[key] = []}
  address = Hash.new{|hsh,key| hsh[key] = []}
  cname = Hash.new{|hsh,key| hsh[key] = []}

  nodeArr = []
  # To remove null values for '.split' method to work
  nodeList.each do |node|
    if node == ''|| node.empty? || node == "\n"
      next
    end
    nodeArr.push(node.strip.split(','))
  end
    # Creating the key value Hash
  nodeArr.each do |(type,domain,source)|
    if type == "CNAME"
      cname[domain.strip.to_sym].push(source.strip)
    elsif type == "A"
      address[domain.strip.to_sym].push(source.strip)
    end
  end
  # Adding CNAME hash and ADDRESS hash into domain hash
  domain[:CNAME].push(cname)
  domain[:ADDRESS].push(address)
  #p cname
  #puts "\n"
  #p address
  return domain
end

# Define resolve method here
def resolve(records, lookup_chain, domain)
  # check if key exists
  count = 0
  for keyHash in records[:ADDRESS]
    if keyHash.has_key? domain.to_sym
      count=1
    end
  end

  for keyHash in records[:CNAME]
    if keyHash.has_key? domain.to_sym
      count=1
    end
  end

   if count == 0
    puts "Error: record not found for #{domain}"
    exit
   end

  # flag to exit when it enters ADDRESS key
  flag = 0

  # Access the Keys in ADDRESS key from records
  for keyHash in records[:ADDRESS]
    if keyHash.has_key? domain.to_sym
      # p keyHash.has_key? domain.to_sym
      lookup_chain.push(keyHash[domain.to_sym][0])
      flag = 1
      break
    end
  end


  if flag == 0
    for keyHash in records[:CNAME]
      if keyHash.has_key? domain.to_sym
        # p keyHash.has_key? domain.to_sym
        # p keyHash[domain.to_sym][0]
        lookup_chain.push(keyHash[domain.to_sym][0])
        # p lookup_chain
        resolve(records, lookup_chain, keyHash[domain.to_sym][0])
      else
        flag = 1
        #Recursion till it enters :ADDRESS key
        resolve(records, lookup_chain, keyHash[domain.to_sym][0])
        break
      end
    end
    # puts "this is final :#{lookup_chain}"
    if lookup_chain.length == 1
      puts "Error: record not found for #{lookup_chain}"
    else
      return lookup_chain
    end
  else
    if lookup_chain.length == 1
      puts "Error: record not found for #{lookup_chain}"
    else
      return lookup_chain
    end
  end
end

# ********* Ends *********

dns_records  = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
puts lookup_chain.join(" => ")
