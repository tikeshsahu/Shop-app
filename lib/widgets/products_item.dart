import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kharido_app/pages/product_detail_page.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String brand;
  final String imageUrl;
  final String description;
  final double price;
  final String discount;

  const ProductItem({
    @required this.id,
    @required this.brand,
    @required this.imageUrl,
    @required this.description,
    @required this.price,
    @required this.discount
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProductDetailPage.routeName, arguments: id);
          },
          child: Card(
            child: Column(
              children: [
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  height: 242,
                  width: 200,
                  //cacheHeight: 100,
                ),
                Container(
                  child: Column(
                    children: [
                       Row(
                          children: [
                            Text(
                              brand,  
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700],
                                  fontFamily: GoogleFonts.stoke().fontFamily),
                            ),
                            //SizedBox(width: 50,),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: (){}, 
                                    icon: Icon(Icons.favorite_border_sharp,
                                    )),
                              ],
                            ),
                            
                          ],
                        ),
                      
                      
                          
                          Row(
                            children: [
                              Text(description,
                                  
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[500],
                                      fontSize: 14)

                                      ),
                            ],
                          ),
                        
                      
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Row(
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 40),
                          //   child: 
                            Text(
                              'Rs.$price',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  fontFamily: GoogleFonts.martel().fontFamily),
                                  
                            ),
                          //),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(discount,
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.martel().fontFamily,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
