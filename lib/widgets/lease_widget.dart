import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:kmrl_connect_to_business/models/lease_model.dart';
import 'package:kmrl_connect_to_business/styles/colors.dart';
import 'package:kmrl_connect_to_business/styles/icons.dart';

class LeaseWidget extends StatelessWidget {
  const LeaseWidget({
    Key? key,
    required this.leaseData,
    required this.onTapLease,
    required this.onTapInvoice,
    required this.onTapElectricity,
    required this.onTapWater,
    required this.onTapPayments,
    required this.onTapBalance,
  }) : super(key: key);
  final VoidCallback onTapLease;
  final VoidCallback onTapInvoice;
  final VoidCallback onTapElectricity;
  final VoidCallback onTapWater;
  final VoidCallback onTapPayments;
  final VoidCallback onTapBalance;
  final LeaseData leaseData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.08,
          right: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1.5),
            color: Colors.black26,
            blurRadius: 3,
          )
        ],
      ),
      child: ExpansionTile(
        initiallyExpanded: false,
        leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: kPrimaryColor),
            child: Center(
              child: Text('L',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)),
            )),
        title: Text('${leaseData.materialNo}',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontWeight: FontWeight.bold)),
        subtitle: Text(
          '${leaseData.spaceLocation}',
          style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 12),
        ),
        trailing: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: lightBlueColor.withOpacity(0.3),
          ),
          child: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 20,
          ),
        ),
        children: [
          Column(
            children: [
              ListTile(
                onTap: onTapLease,
                leading: KmrlIcons.lease(),
                title: Text("Contract Details"),
              ),
              ListTile(
                onTap: onTapInvoice,
                leading: KmrlIcons.invoice(),
                title: Text("Rental Invoice"),
              ),
              ListTile(
                onTap: onTapElectricity,
                leading: KmrlIcons.bulb(),
                title: Text("Electricity Bill"),
              ),
              ListTile(
                onTap: onTapWater,
                leading: KmrlIcons.water(),
                title: Text("Water Bill"),
              ),
              ListTile(
                onTap: onTapPayments,
                leading: KmrlIcons.payment(),
                title: Text("Payments"),
              ),
              ListTile(
                onTap: onTapBalance,
                leading: KmrlIcons.balance(),
                title: Text("Balance & History"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
