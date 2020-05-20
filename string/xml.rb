

xml = {
          ItemSearchResponse: {
              Items: {
                  Item: {
                      ItemAttributes: {
                          Title: "title",
                          Brand: "brand"
                      },
                      BrowseNodes: {
                          BrowseNode: {
                              BrowseNodeId: 12345678
                          }
                      }
                  }
              }
          }
      }.to_xml

puts "xml : #{xml}"
