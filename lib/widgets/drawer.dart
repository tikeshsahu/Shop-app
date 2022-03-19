import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kharido_app/pages/auth_page.dart';
import 'package:kharido_app/pages/products_overview_page.dart';
import 'package:kharido_app/pages/welcome_page.dart';
import 'package:kharido_app/providers/auth.dart';
import 'package:provider/provider.dart';
import '../pages/orders_page.dart';
import '../pages/user_product_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SafeArea(
              child: Container(
            height: 240,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 85,
                  backgroundImage: NetworkImage(
                      'https://media.istockphoto.com/photos/pleasant-young-indian-woman-freelancer-consult-client-via-video-call-picture-id1300972573?b=1&k=20&m=1300972573&s=170667a&w=0&h=xuAsEkMkoBbc5Nh-nButyq3DU297V_tnak-60VarrR0='),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Username',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: GoogleFonts.lato().fontFamily,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(
              Icons.category_outlined,
              color: Colors.grey,
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ProductOverviewPage.routeName);
            },
            title: Text('Shop',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600])),
          ),
          Divider(
            color: Colors.grey[500],
            height: 12,
          ),
          ListTile(
            leading: Icon(Icons.playlist_add_check),
            title: Text(
              'Orders',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrdersPage.routeName);
            },
          ),
          Divider(
            color: Colors.grey[500],
            height: 15,
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text(
              'Manage Products',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(UserProductsPage.routeName);
            },
          ),
          Divider(
            color: Colors.grey[500],
            height: 12,
          ),
          //
          ListTile(
            leading: Icon(Icons.playlist_add_check),
            title: Text(
              'start_page',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            onTap: () {
              //Navigator.of(context).pushReplacementNamed(WelcomePage.routeName);
            },
          ),
          ////
          Divider(
            color: Colors.grey[500],
            height: 12,
          ),
          //
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Log out',
              style: TextStyle(fontSize: 15, color: Colors.grey[600]),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logOut();
            },
          ),
        ],
      ),
    );
  }
}
