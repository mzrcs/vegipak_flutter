import 'package:flutter/material.dart';
import 'package:vegipak/constants.dart';

class CustomDialogBox extends StatefulWidget {
  final int id, qty;
  final String title, price, image, unit;

  const CustomDialogBox(
      {Key? key,
      required this.id,
      required this.title,
      required this.price,
      required this.image,
      required this.unit,
      required this.qty})
      : super(key: key);

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  int counter = 0;
  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  @override
  void initState() {
    super.initState();
    counter = widget.qty;
    _controller = TextEditingController(text: widget.qty.toString());
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
                left: Constants.padding,
                top: Constants.avatarRadius,
                right: Constants.padding,
                bottom: Constants.padding),
            margin: const EdgeInsets.only(top: Constants.avatarRadius),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(Constants.padding),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 10),
                      blurRadius: 10),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Price : ${widget.price}/${widget.unit}",
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        onPressed: () {
                          setState(() {
                            if (counter > 0) {
                              setState(() {
                                counter--;
                                _controller = TextEditingController(
                                    text: counter.toString());
                              });
                            }
                          });
                        },
                        child: const Icon(Icons.remove)),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextFormField(
                      style: const TextStyle(fontSize: 20, color: Colors.green),
                      controller: _controller,
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 0, right: 15),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        onPressed: () {
                          if (counter < 10) {
                            setState(() {
                              counter++;
                              _controller = TextEditingController(
                                  text: counter.toString());
                            });
                          }
                        },
                        child: const Icon(Icons.add)),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(
                    Radius.circular(Constants.avatarRadius)),
                child: Image.asset(widget.image)),
          ),
        ),
        Positioned(
          left: 70,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: () {
              return Navigator.pop(context, counter);
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomRight: Radius.circular(10)),
                  color: Colors.green),
              child: const Text(
                'Add to cart',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
            ),
          ),
        )
      ],
    );
  }
}
