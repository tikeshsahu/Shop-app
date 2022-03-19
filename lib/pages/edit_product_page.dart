import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kharido_app/providers/products_providers.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class EditProductPage extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  String _selectedCategory = 'Appliances';
  var expanded = false;
  final _priceFocusNode = FocusNode();
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
      id: null,
      title: '',
      price: 0,
      description: "",
      discount: '',
      imageUrl: '',
      category: '');
  var inItValues = {
    'title': '',
    'price': '',
    'decription': '',
    'discount': '',
    'imageUrl': '',
    'category': ''
  };
  var isInIt = true;
  var isLoading = false;

  @override
  void initState() {
    _imageUrlFocusNode.addListener(updateImageUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInIt) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);
        inItValues = {
          'title': _editedProduct.title,
          'price': _editedProduct.price.toString(),
          'decription': _editedProduct.description,
          'discount': _editedProduct.discount,
          'imageUrl': '',
          'category': ''
        };
        _imageUrlController.text = _editedProduct.imageUrl;
      }
    }
    isInIt = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _imageUrlFocusNode.removeListener(updateImageUrl);
    _priceFocusNode.dispose();
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  void updateImageUrl() {
    if (!_imageUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  Future<void> saveForm() async {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    setState(() {
      isLoading = true;
    });
    if (_editedProduct.id != null) {
      await Provider.of<Products>(context, listen: false)
          .updateProducts(_editedProduct.id, _editedProduct);
    } else {
      try {
        await Provider.of<Products>(context, listen: false)
            .addProducts(_editedProduct);
      } catch (error) {
        await showDialog<Null>(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('An Error Occured'),
                  content: Text('Something went wrong'),
                  actions: [
                    FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Text('Okay'))
                  ],
                ));
      }
      // finally{
      //    setState(() {
      //   isLoading = true;
      // });
      // Navigator.of(context).pop();
      // }
    }
    ;
    setState(() {
      isLoading = true;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         Provider.of<Products>(context,listen: false).deleteProducts(id);
        //       },
        //       icon: Icon(Icons.delete))
        // ],
      ),
      body: isLoading
          ? Center(
              child: SpinKitSquareCircle(
              size: 70,
              color: Colors.amber[800],
              //controller: AnimationController( duration: const Duration(milliseconds: 1200))
            ))
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    ListTile(
                      title: Text('Category'),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            expanded = !expanded;
                          });
                        },
                        icon: Icon(expanded
                            ? Icons.expand_less_rounded
                            : Icons.expand_more),
                      ),
                    ),
                    if(expanded)
                    Container(
                      child:
                            Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Please let us know your product category:'),
                    ListTile(
                      leading: Radio<String>(
                        value: 'Appliances',
                        groupValue: _selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                           _editedProduct = Product(
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite,
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imageUrl: _editedProduct.imageUrl,
                            discount: _editedProduct.discount,
                            category: value);
                        },
                      ),
                      title: const Text('Appliances'),
                    ),
                    ListTile(
                      leading: Radio<String>(
                        value: 'Fashion',
                        groupValue: _selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                          _editedProduct = Product(
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite,
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imageUrl: _editedProduct.imageUrl,
                            discount: _editedProduct.discount,
                            category: value);
                        },
                      ),
                      title: const Text('Fashion'),
                    ),
                    ListTile(
                      leading: Radio<String>(
                        value: 'Grocery',
                        groupValue: _selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                           _editedProduct = Product(
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite,
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imageUrl: _editedProduct.imageUrl,
                            discount: _editedProduct.discount,
                            category: value);
                        },
                      ),
                      title: const Text('Grocery'),
                    ),
                    ListTile(
                      leading: Radio<String>(
                        value: 'Tech',
                        groupValue: _selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value;
                          });
                           _editedProduct = Product(
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite,
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imageUrl: _editedProduct.imageUrl,
                            discount: _editedProduct.discount,
                            category: value);
                        },
                      ),
                      title: const Text('Tech'),
                    ),
                    
            ],
          )),
                    ),
                    TextFormField(
                      initialValue: inItValues['title'],
                      decoration: InputDecoration(labelText: 'Title'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_priceFocusNode);
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a Title';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite,
                            title: value,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imageUrl: _editedProduct.imageUrl,
                            discount: _editedProduct.discount,
                            category: _editedProduct.category);
                      },
                    ),
                    //
                    TextFormField(
                      initialValue: inItValues['price'],
                      decoration: InputDecoration(labelText: 'Price'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      focusNode: _priceFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a Price';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please provide a valid number';
                        }
                        if (double.parse(value) <= 0) {
                          return 'Please enter a number greater than Zero';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: double.parse(value),
                            imageUrl: _editedProduct.imageUrl,
                            discount: _editedProduct.discount,
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite,
                            category: _editedProduct.category);
                      },
                    ),
                    //
                    TextFormField(
                      initialValue: inItValues['discount'],
                      decoration: InputDecoration(labelText: 'Discount  ( % a)'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      onSaved: (value) {
                        _editedProduct = Product(
                          id: _editedProduct.id,
                          isFavorite: _editedProduct.isFavorite,
                          title: _editedProduct.title,
                          description: _editedProduct.description,
                          price: _editedProduct.price,
                          imageUrl: _editedProduct.imageUrl,
                          discount: value,
                          category: _editedProduct.category,
                        );
                      },
                    ),
                    //
                    TextFormField(
                      initialValue: inItValues['description'],
                      decoration: InputDecoration(labelText: 'Description'),
                      maxLines: 3,
                      keyboardType: TextInputType.multiline,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please provide a Description';
                        }
                        if (value.length < 10) {
                          return 'Should be atleast 10 characters long';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                            id: _editedProduct.id,
                            isFavorite: _editedProduct.isFavorite,
                            title: _editedProduct.title,
                            description: value,
                            price: _editedProduct.price,
                            imageUrl: _editedProduct.imageUrl,
                            discount: _editedProduct.discount,
                            category: _editedProduct.category);
                      },
                    ),
                    //
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: 8, right: 10),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            )),
                            child: _imageUrlController.text.isEmpty
                                ? Icon(
                                    Icons.add_a_photo,
                                    color: Colors.grey,
                                    size: 37,
                                  )
                                : FittedBox(
                                    child:
                                        Image.network(_imageUrlController.text),
                                    fit: BoxFit.contain,
                                  )),
                        Expanded(
                          child: TextFormField(
                            //initialValue: inItValues['imageUrl'],
                            decoration: InputDecoration(
                              labelText: 'Image URL',
                            ),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.done,
                            controller: _imageUrlController,
                            focusNode: _imageUrlFocusNode,
                            onEditingComplete: () {
                              setState(() {});
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please provide an URL';
                              }
                              if (value.length < 10) {
                                return 'Should be atleast 10 characters long';
                              }
                              if (!value.startsWith('http') &&
                                  !value.startsWith('https')) {
                                return 'Please enter a valid URL';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _editedProduct = Product(
                                  id: _editedProduct.id,
                                  isFavorite: _editedProduct.isFavorite,
                                  title: _editedProduct.title,
                                  description: _editedProduct.description,
                                  price: _editedProduct.price,
                                  imageUrl: value,
                                  discount: _editedProduct.discount,
                                  category: _editedProduct.category);
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlatButton(
          onPressed: (saveForm),
          child: Text(
            'SAVE',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          color: Colors.pink[600],
          height: 50,
        ),
      ),
    );
  }
}
