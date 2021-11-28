import 'package:flutter/material.dart';
import 'package:legajos_app/models/personal_response.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PersonalElement personal =
        ModalRoute.of(context)!.settings.arguments as PersonalElement;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(
              '${personal.apellido1} ${personal.apellido2 ?? ''} ${personal.nombre1} ${personal.nombre2 ?? ''}'),
          SliverList(
              delegate: SliverChildListDelegate(
                  [_PosterYData(personal), _DetalleData(personal)]))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final String nombre;

  _CustomAppBar(this.nombre) {}

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.indigo,
        expandedHeight: 80,
        floating: false,
        pinned: true,
        title: Text(
          this.nombre,
          style: TextStyle(
            fontSize: 20,
          ),
        ));
  }
}

class _PosterYData extends StatelessWidget {
  final PersonalElement _persona;

  const _PosterYData(this._persona);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Hero(
            tag: this._persona.legajo!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                  width: 150.0,
                  placeholder: AssetImage('assets/loading.gif'),
                  image: NetworkImage(this._persona.fotoUrl)),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Grado: ${this._persona.grado.grado}',
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Destino: ${this._persona.destino.destino}',
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Departamento: ${this._persona.departamento.departamento}',
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DetalleData extends StatelessWidget {
  final PersonalElement _persona;

  const _DetalleData(this._persona);

  @override
  Widget build(BuildContext context) {
    String _situacion =
        (this._persona.situacion.situacion.toString() == 'SitacionEnum.ACTIVO')
            ? 'Activo'
            : 'Pasivo';
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: Expanded(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  "Situación: ${_situacion}",
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                )),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Text(
                  "Escala Jerárquica: ${(this._persona.escalaJerarquica.escalaJerarquica.toString() == 'EscalaJerarquicaEnum.SUBOFICIAL') ? 'Suboficial' : 'Oficial'}",
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                ))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  "Escalafón: ${(this._persona.escalafon.escalafon.toString() == 'EscalafonEnum.PENITENCIARIO') ? 'Penitenciario' : 'Profesional y Técnico'}",
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                )),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Text(
                  "Domicilio: ${(this._persona.domicilio)}",
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 5,
                  textAlign: TextAlign.left,
                ))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  //"Estado Civil: ${this._persona.estadoCivil.estadoCivil}",
                  "Estado Civil: ${(this._persona.estadoCivil.estadoCivil.toString() == 'EstadoCivilEnum.CASADO') ? 'Casado' : 'Soltero'}",
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                )),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Text(
                  "Correo: ${(this._persona.email)}",
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 5,
                  textAlign: TextAlign.left,
                ))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  //"Estado Civil: ${this._persona.estadoCivil.estadoCivil}",
                  "Fecha de Nacimiento: ${this._persona.fechaNacimiento}",
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                )),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Text(
                  "Legajo: ${(this._persona.legajo)}",
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 5,
                  textAlign: TextAlign.left,
                ))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  //"Estado Civil: ${this._persona.estadoCivil.estadoCivil}",
                  "Peso: ${this._persona.peso}",
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                )),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Text(
                  "Altura: ${(this._persona.altura)}",
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 5,
                  textAlign: TextAlign.left,
                ))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                  //"Estado Civil: ${this._persona.estadoCivil.estadoCivil}",
                  "Nivel Educativo: ${(this._persona.nivelEducativo.nivelEducativo.toString() == 'NivelEducativoEnum.SECUNDARIA_COMPLETA') ? 'Secundario Completo' : 'Terciario Incompleto'}",
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 3,
                  textAlign: TextAlign.left,
                )),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Text(
                  "Funciones: ${(this._persona.funcion)}",
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.visible,
                  maxLines: 5,
                  textAlign: TextAlign.left,
                ))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Ut eiusmod sunt irure dolor ullamco proident deserunt nisi irure. Nisi sint exercitation ipsum sit ex occaecat ex dolor nulla est labore nostrud elit. Non quis officia amet nostrud magna excepteur ea nulla duis.',
              style: Theme.of(context).textTheme.headline6,
              // overflow: TextOverflow.visible,
              // maxLines: 3,
              textAlign: TextAlign.justify,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Ut eiusmod sunt irure dolor ullamco proident deserunt nisi irure. Nisi sint exercitation ipsum sit ex occaecat ex dolor nulla est labore nostrud elit. Non quis officia amet nostrud magna excepteur ea nulla duis.',
              style: Theme.of(context).textTheme.headline6,
              // overflow: TextOverflow.visible,
              // maxLines: 3,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
