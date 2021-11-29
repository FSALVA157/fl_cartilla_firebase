// To parse this JSON data, do
//
//     final personal = personalFromMap(jsonString);

import 'dart:convert';

class PersonalElement {
  PersonalElement({
    required this.idPersonal,
    required this.apellido1,
    this.apellido2,
    required this.nombre1,
    this.nombre2,
    this.nombre3,
    required this.dni,
    this.fechaNacimiento,
    this.fechaIngreso,
    this.ultimoAscenso,
    this.legajo,
    this.cuil,
    required this.sexoId,
    required this.estadoCivilId,
    required this.destinoId,
    required this.departamentoId,
    required this.divisionId,
    required this.sectorId,
    required this.seccionGuardiaId,
    this.funcion,
    required this.escalafonId,
    required this.escalaJerarquicaId,
    required this.gradoId,
    required this.nacionalidad,
    this.domicilio,
    required this.provinciaId,
    required this.departamentoProvincialId,
    required this.municipioId,
    required this.ciudadId,
    this.telefonos,
    this.email,
    this.altura,
    this.peso,
    required this.nivelEducativoId,
    this.registradoPor,
    required this.situacionId,
    this.foto,
    this.detalles,
    required this.fechaAlta,
    this.ultimaActualizacion,
    this.fechaBaja,
    required this.pdfs,
    required this.sexo,
    required this.estadoCivil,
    required this.destino,
    required this.departamento,
    required this.division,
    required this.sector,
    required this.seccionGuardia,
    required this.escalafon,
    required this.escalaJerarquica,
    required this.grado,
    required this.provincia,
    required this.departamentoProvincial,
    required this.municipio,
    required this.ciudad,
    required this.nivelEducativo,
    required this.situacion,
  });

  int idPersonal;
  String apellido1;
  String? apellido2;
  String nombre1;
  String? nombre2;
  String? nombre3;
  int dni;
  DateTime? fechaNacimiento;
  DateTime? fechaIngreso;
  DateTime? ultimoAscenso;
  int? legajo;
  String? cuil;
  int sexoId;
  int estadoCivilId;
  int destinoId;
  int departamentoId;
  int divisionId;
  int sectorId;
  int seccionGuardiaId;
  String? funcion;
  int escalafonId;
  int escalaJerarquicaId;
  int gradoId;
  String nacionalidad;
  String? domicilio;
  int provinciaId;
  int departamentoProvincialId;
  int municipioId;
  int ciudadId;
  String? telefonos;
  String? email;
  String? altura;
  String? peso;
  int nivelEducativoId;
  int? registradoPor;
  int situacionId;
  String? foto;
  String? detalles;
  DateTime fechaAlta;
  DateTime? ultimaActualizacion;
  DateTime? fechaBaja;
  List<Pdf> pdfs;
  SexoClass sexo;
  EstadoCivilClass estadoCivil;
  Destino destino;
  PurpleDepartamento departamento;
  Division division;
  SectorClass sector;
  SeccionGuardia seccionGuardia;
  EscalafonClass escalafon;
  EscalaJerarquicaClass escalaJerarquica;
  Grado grado;
  Provincia provincia;
  DepartamentoProvincialElement departamentoProvincial;
  Municipio municipio;
  CiudadElement ciudad;
  NivelEducativoClass nivelEducativo;
  SituacionClass situacion;

  get fotoUrl {
    if (this.foto.toString() != 'no-image.png') {
      return this.foto.toString();
    } else {
      return 'https://i.stack.imgur.com/GNhxO.png';
    }
  }

  factory PersonalElement.fromJson(String str) =>
      PersonalElement.fromMap(json.decode(str));

  //String toJson() => json.encode(toMap());

  factory PersonalElement.fromMap(Map<String, dynamic> json) => PersonalElement(
        idPersonal: json["id_personal"],
        apellido1: json["apellido_1"],
        apellido2: json["apellido_2"],
        nombre1: json["nombre_1"],
        nombre2: json["nombre_2"],
        nombre3: json["nombre_3"],
        dni: json["dni"],
        fechaNacimiento: DateTime.parse(json["fecha_nacimiento"]),
        fechaIngreso: json["fecha_ingreso"] == null
            ? null
            : DateTime.parse(json["fecha_ingreso"]),
        ultimoAscenso: json["ultimo_ascenso"] == null
            ? null
            : DateTime.parse(json["ultimo_ascenso"]),
        legajo: json["legajo"],
        cuil: json["cuil"],
        sexoId: json["sexo_id"],
        estadoCivilId: json["estado_civil_id"],
        destinoId: json["destino_id"],
        departamentoId: json["departamento_id"],
        divisionId: json["division_id"],
        sectorId: json["sector_id"],
        seccionGuardiaId: json["seccion_guardia_id"],
        funcion: json["funcion"] == null ? null : json["funcion"],
        escalafonId: json["escalafon_id"],
        escalaJerarquicaId: json["escala_jerarquica_id"],
        gradoId: json["grado_id"],
        nacionalidad: json["nacionalidad"],
        domicilio: json["domicilio"],
        provinciaId: json["provincia_id"],
        departamentoProvincialId: json["departamento_provincial_id"],
        municipioId: json["municipio_id"],
        ciudadId: json["ciudad_id"],
        telefonos: json["telefonos"],
        email: json["email"],
        altura: json["altura"],
        peso: json["peso"],
        nivelEducativoId: json["nivel_educativo_id"],
        registradoPor: json["registrado_por"],
        situacionId: json["situacion_id"],
        foto: json["foto"],
        detalles: json["detalles"],
        fechaAlta: DateTime.parse(json["fecha_alta"]),
        ultimaActualizacion: DateTime.parse(json["ultima_actualizacion"]),
        fechaBaja: json["fecha_baja"],
        pdfs: List<Pdf>.from(json["pdfs"].map((x) => Pdf.fromMap(x))),
        sexo: SexoClass.fromMap(json["sexo"]),
        estadoCivil: EstadoCivilClass.fromMap(json["estado_civil"]),
        destino: Destino.fromMap(json["destino"]),
        departamento: PurpleDepartamento.fromMap(json["departamento"]),
        division: Division.fromMap(json["division"]),
        sector: SectorClass.fromMap(json["sector"]),
        seccionGuardia: SeccionGuardia.fromMap(json["seccion_guardia"]),
        escalafon: EscalafonClass.fromMap(json["escalafon"]),
        escalaJerarquica:
            EscalaJerarquicaClass.fromMap(json["escala_jerarquica"]),
        grado: Grado.fromMap(json["grado"]),
        provincia: Provincia.fromMap(json["provincia"]),
        departamentoProvincial: DepartamentoProvincialElement.fromMap(
            json["departamento_provincial"]),
        municipio: Municipio.fromMap(json["municipio"]),
        ciudad: CiudadElement.fromMap(json["ciudad"]),
        nivelEducativo: NivelEducativoClass.fromMap(json["nivel_educativo"]),
        situacion: SituacionClass.fromMap(json["situacion"]),
      );

  Map<String, dynamic> toMap() => {
        "id_personal": idPersonal,
        "apellido_1": apellido1,
        "apellido_2": apellido2 == null ? null : apellido2,
        "nombre_1": nombre1,
        "nombre_2": nombre2 == null ? null : nombre2,
        "nombre_3": nombre3 == null ? null : nombre3,
        "dni": dni,
        "fecha_nacimiento": fechaNacimiento,
        // "${fechaNacimiento.year.toString().padLeft(4, '0')}-${fechaNacimiento.month.toString().padLeft(2, '0')}-${fechaNacimiento.day.toString().padLeft(2, '0')}",
        "fecha_ingreso": fechaIngreso == null ? null : fechaIngreso,
        "ultimo_ascenso": ultimoAscenso == null ? null : ultimoAscenso,
        "legajo": legajo,
        "cuil": cuil,
        "sexo_id": sexoId,
        "estado_civil_id": estadoCivilId,
        "destino_id": destinoId,
        "departamento_id": departamentoId,
        "division_id": divisionId,
        "sector_id": sectorId,
        "seccion_guardia_id": seccionGuardiaId,
        "funcion": funcion == null ? null : funcion,
        "escalafon_id": escalafonId,
        "escala_jerarquica_id": escalaJerarquicaId,
        "grado_id": gradoId,
        "nacionalidad": nacionalidad,
        "domicilio": domicilio,
        "provincia_id": provinciaId,
        "departamento_provincial_id": departamentoProvincialId,
        "municipio_id": municipioId,
        "ciudad_id": ciudadId,
        "telefonos": telefonos,
        "email": email,
        "altura": altura,
        "peso": peso,
        "nivel_educativo_id": nivelEducativoId,
        "registrado_por": registradoPor,
        "situacion_id": situacionId,
        "foto": foto,
        "detalles": detalles,
        "fecha_alta": fechaAlta.toIso8601String(),
        "ultima_actualizacion": ultimaActualizacion,
        "fecha_baja": fechaBaja,
        "pdfs": List<dynamic>.from(pdfs.map((x) => x.toMap())),
        "sexo": sexo.toMap(),
        "estado_civil": estadoCivil.toMap(),
        "destino": destino.toMap(),
        "departamento": departamento.toMap(),
        "division": division.toMap(),
        "sector": sector.toMap(),
        "seccion_guardia": seccionGuardia.toMap(),
        "escalafon": escalafon.toMap(),
        "escala_jerarquica": escalaJerarquica.toMap(),
        "grado": grado.toMap(),
        "provincia": provincia.toMap(),
        "departamento_provincial": departamentoProvincial.toMap(),
        "municipio": municipio.toMap(),
        "ciudad": ciudad.toMap(),
        "nivel_educativo": nivelEducativo.toMap(),
        "situacion": situacion.toMap(),
      };
}

class CiudadElement {
  CiudadElement({
    this.idCiudad,
    this.ciudad,
    this.municipioId,
    this.provinciaId,
  });

  int? idCiudad;
  CiudadEnum? ciudad;
  int? municipioId;
  int? provinciaId;

  factory CiudadElement.fromJson(String str) =>
      CiudadElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CiudadElement.fromMap(Map<String, dynamic> json) => CiudadElement(
        idCiudad: json["id_ciudad"],
        ciudad: ciudadEnumValues.map![json["ciudad"]],
        municipioId: json["municipio_id"],
        provinciaId: json["provincia_id"],
      );

  Map<String, dynamic> toMap() => {
        "id_ciudad": idCiudad,
        "ciudad": ciudadEnumValues.reverse![ciudad],
        "municipio_id": municipioId,
        "provincia_id": provinciaId,
      };
}

enum CiudadEnum { SIN_DEFINIR, SALTA }

final ciudadEnumValues = EnumValues(
    {"SALTA": CiudadEnum.SALTA, "sin definir": CiudadEnum.SIN_DEFINIR});

class PurpleDepartamento {
  PurpleDepartamento({
    this.idDepartamento,
    this.departamento,
    this.destinoId,
  });

  int? idDepartamento;
  String? departamento;
  int? destinoId;

  factory PurpleDepartamento.fromJson(String str) =>
      PurpleDepartamento.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PurpleDepartamento.fromMap(Map<String, dynamic> json) =>
      PurpleDepartamento(
        idDepartamento: json["id_departamento"],
        departamento: json["departamento"],
        destinoId: json["destino_id"],
      );

  Map<String, dynamic> toMap() => {
        "id_departamento": idDepartamento,
        "departamento": departamento,
        "destino_id": destinoId,
      };
}

class DepartamentoProvincialElement {
  DepartamentoProvincialElement({
    this.idDptoProv,
    this.departamentoProvincial,
    this.provinciaId,
    this.municipios,
  });

  int? idDptoProv;
  String? departamentoProvincial;
  int? provinciaId;
  List<Municipio>? municipios;

  factory DepartamentoProvincialElement.fromJson(String str) =>
      DepartamentoProvincialElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DepartamentoProvincialElement.fromMap(Map<String, dynamic> json) =>
      DepartamentoProvincialElement(
        idDptoProv: json["id_dpto_prov"],
        departamentoProvincial: json["departamento_provincial"],
        provinciaId: json["provincia_id"],
        municipios: List<Municipio>.from(
            json["municipios"].map((x) => Municipio.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id_dpto_prov": idDptoProv,
        "departamento_provincial": departamentoProvincial,
        "provincia_id": provinciaId,
        "municipios": List<dynamic>.from(municipios!.map((x) => x.toMap())),
      };
}

class Municipio {
  Municipio({
    this.idMunicipio,
    this.municipio,
    this.provinciaId,
    this.departamentoId,
    this.ciudades,
  });

  int? idMunicipio;
  String? municipio;
  int? provinciaId;
  int? departamentoId;
  List<CiudadElement>? ciudades;

  factory Municipio.fromJson(String str) => Municipio.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Municipio.fromMap(Map<String, dynamic> json) => Municipio(
        idMunicipio: json["id_municipio"],
        municipio: json["municipio"],
        provinciaId: json["provincia_id"],
        departamentoId: json["departamento_id"],
        ciudades: List<CiudadElement>.from(
            json["ciudades"].map((x) => CiudadElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id_municipio": idMunicipio,
        "municipio": municipio,
        "provincia_id": provinciaId,
        "departamento_id": departamentoId,
        "ciudades": List<dynamic>.from(ciudades!.map((x) => x.toMap())),
      };
}

class Destino {
  Destino({
    this.idDestino,
    this.destino,
  });

  int? idDestino;
  String? destino;

  factory Destino.fromJson(String str) => Destino.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Destino.fromMap(Map<String, dynamic> json) => Destino(
        idDestino: json["id_destino"],
        destino: json["destino"],
      );

  Map<String, dynamic> toMap() => {
        "id_destino": idDestino,
        "destino": destino,
      };
}

class Division {
  Division({
    this.idDivision,
    this.division,
    this.departamentoId,
  });

  int? idDivision;
  String? division;
  int? departamentoId;

  factory Division.fromJson(String str) => Division.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Division.fromMap(Map<String, dynamic> json) => Division(
        idDivision: json["id_division"],
        division: json["division"],
        departamentoId: json["departamento_id"],
      );

  Map<String, dynamic> toMap() => {
        "id_division": idDivision,
        "division": division,
        "departamento_id": departamentoId,
      };
}

class EscalaJerarquicaClass {
  EscalaJerarquicaClass({
    this.idEscalaJerarquica,
    this.escalaJerarquica,
  });

  int? idEscalaJerarquica;
  EscalaJerarquicaEnum? escalaJerarquica;

  factory EscalaJerarquicaClass.fromJson(String str) =>
      EscalaJerarquicaClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EscalaJerarquicaClass.fromMap(Map<String, dynamic> json) =>
      EscalaJerarquicaClass(
        idEscalaJerarquica: json["id_escala_jerarquica"],
        escalaJerarquica:
            escalaJerarquicaEnumValues.map![json["escala_jerarquica"]],
      );

  Map<String, dynamic> toMap() => {
        "id_escala_jerarquica": idEscalaJerarquica,
        "escala_jerarquica":
            escalaJerarquicaEnumValues.reverse![escalaJerarquica],
      };
}

enum EscalaJerarquicaEnum { SUBOFICIAL, OFICIAL }

final escalaJerarquicaEnumValues = EnumValues({
  "oficial": EscalaJerarquicaEnum.OFICIAL,
  "suboficial": EscalaJerarquicaEnum.SUBOFICIAL
});

class EscalafonClass {
  EscalafonClass({
    this.idEscalafon,
    this.escalafon,
  });

  int? idEscalafon;
  EscalafonEnum? escalafon;

  factory EscalafonClass.fromJson(String str) =>
      EscalafonClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EscalafonClass.fromMap(Map<String, dynamic> json) => EscalafonClass(
        idEscalafon: json["id_escalafon"],
        escalafon: escalafonEnumValues.map![json["escalafon"]],
      );

  Map<String, dynamic> toMap() => {
        "id_escalafon": idEscalafon,
        "escalafon": escalafonEnumValues.reverse![escalafon],
      };
}

enum EscalafonEnum { PENITENCIARIO, PROFESIONAL_Y_TCNICO }

final escalafonEnumValues = EnumValues({
  "Penitenciario": EscalafonEnum.PENITENCIARIO,
  "Profesional y Técnico": EscalafonEnum.PROFESIONAL_Y_TCNICO
});

class EstadoCivilClass {
  EstadoCivilClass({
    this.idEstadoCivil,
    this.estadoCivil,
  });

  int? idEstadoCivil;
  EstadoCivilEnum? estadoCivil;

  factory EstadoCivilClass.fromJson(String str) =>
      EstadoCivilClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EstadoCivilClass.fromMap(Map<String, dynamic> json) =>
      EstadoCivilClass(
        idEstadoCivil: json["id_estado_civil"],
        estadoCivil: estadoCivilEnumValues.map![json["estado_civil"]],
      );

  Map<String, dynamic> toMap() => {
        "id_estado_civil": idEstadoCivil,
        "estado_civil": estadoCivilEnumValues.reverse![estadoCivil],
      };
}

enum EstadoCivilEnum { SOLTERO, CASADO }

final estadoCivilEnumValues = EnumValues(
    {"casado": EstadoCivilEnum.CASADO, "soltero": EstadoCivilEnum.SOLTERO});

class Grado {
  Grado({
    this.idGrado,
    this.grado,
    this.escalaJerarquicaId,
    this.jerarquiaId,
  });

  int? idGrado;
  String? grado;
  int? escalaJerarquicaId;
  int? jerarquiaId;

  factory Grado.fromJson(String str) => Grado.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Grado.fromMap(Map<String, dynamic> json) => Grado(
        idGrado: json["id_grado"],
        grado: json["grado"],
        escalaJerarquicaId: json["escala_jerarquica_id"],
        jerarquiaId: json["jerarquia_id"],
      );

  Map<String, dynamic> toMap() => {
        "id_grado": idGrado,
        "grado": grado,
        "escala_jerarquica_id": escalaJerarquicaId,
        "jerarquia_id": jerarquiaId,
      };
}

enum Nacionalidad { ARGENTINO, ARGENTINA }

final nacionalidadValues = EnumValues(
    {"argentina": Nacionalidad.ARGENTINA, "argentino": Nacionalidad.ARGENTINO});

class NivelEducativoClass {
  NivelEducativoClass({
    this.idNivelEducativo,
    this.nivelEducativo,
  });

  int? idNivelEducativo;
  NivelEducativoEnum? nivelEducativo;

  factory NivelEducativoClass.fromJson(String str) =>
      NivelEducativoClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NivelEducativoClass.fromMap(Map<String, dynamic> json) =>
      NivelEducativoClass(
        idNivelEducativo: json["id_nivel_educativo"],
        nivelEducativo: nivelEducativoEnumValues.map![json["nivel_educativo"]],
      );

  Map<String, dynamic> toMap() => {
        "id_nivel_educativo": idNivelEducativo,
        "nivel_educativo": nivelEducativoEnumValues.reverse![nivelEducativo],
      };
}

enum NivelEducativoEnum {
  SECUNDARIA_COMPLETA,
  TERCIARIO_COMPLETO,
  TERCIARIO_INCOMPLETO
}

final nivelEducativoEnumValues = EnumValues({
  "secundaria completa": NivelEducativoEnum.SECUNDARIA_COMPLETA,
  "terciario completo": NivelEducativoEnum.TERCIARIO_COMPLETO,
  "terciario incompleto": NivelEducativoEnum.TERCIARIO_INCOMPLETO
});

class Pdf {
  Pdf({
    this.idArchivo,
    this.legajoPersonal,
    this.nombreArchivo,
    this.detalle,
    this.indice,
    this.fechaDocumento,
    this.fechaAlta,
    this.ultimaActualizacion,
    this.fechaBaja,
  });

  int? idArchivo;
  int? legajoPersonal;
  String? nombreArchivo;
  String? detalle;
  int? indice;
  DateTime? fechaDocumento;
  DateTime? fechaAlta;
  DateTime? ultimaActualizacion;
  dynamic? fechaBaja;

  factory Pdf.fromJson(String str) => Pdf.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pdf.fromMap(Map<String, dynamic> json) => Pdf(
        idArchivo: json["id_archivo"],
        legajoPersonal: json["legajo_personal"],
        nombreArchivo: json["nombre_archivo"],
        detalle: json["detalle"],
        indice: json["indice"],
        fechaDocumento: DateTime.parse(json["fecha_documento"]),
        fechaAlta: DateTime.parse(json["fecha_alta"]),
        ultimaActualizacion: DateTime.parse(json["ultima_actualizacion"]),
        fechaBaja: json["fecha_baja"],
      );

  Map<String, dynamic> toMap() => {
        "id_archivo": idArchivo,
        "legajo_personal": legajoPersonal,
        "nombre_archivo": nombreArchivo,
        "detalle": detalle,
        "indice": indice,
        "fecha_documento": fechaDocumento,
        "fecha_alta": fechaAlta,
        "ultima_actualizacion": ultimaActualizacion,
        "fecha_baja": fechaBaja,
      };
}

class Provincia {
  Provincia({
    this.idProvincia,
    this.provincia,
    this.departamentos,
  });

  int? idProvincia;
  CiudadEnum? provincia;
  List<DepartamentoProvincialElement>? departamentos;

  factory Provincia.fromJson(String str) => Provincia.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Provincia.fromMap(Map<String, dynamic> json) => Provincia(
        idProvincia: json["id_provincia"],
        provincia: ciudadEnumValues.map![json["provincia"]],
        departamentos: List<DepartamentoProvincialElement>.from(
            json["departamentos"]
                .map((x) => DepartamentoProvincialElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id_provincia": idProvincia,
        "provincia": ciudadEnumValues.reverse![provincia],
        "departamentos":
            List<dynamic>.from(departamentos!.map((x) => x.toMap())),
      };
}

class SeccionGuardia {
  SeccionGuardia({
    this.idSeccion,
    this.seccion,
    this.departamentoId,
  });

  int? idSeccion;
  Seccion? seccion;
  int? departamentoId;

  factory SeccionGuardia.fromJson(String str) =>
      SeccionGuardia.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SeccionGuardia.fromMap(Map<String, dynamic> json) => SeccionGuardia(
        idSeccion: json["id_seccion"],
        seccion: seccionValues.map![json["seccion"]],
        departamentoId: json["departamento_id"],
      );

  Map<String, dynamic> toMap() => {
        "id_seccion": idSeccion,
        "seccion": seccionValues.reverse![seccion],
        "departamento_id": departamentoId,
      };
}

enum Seccion { SIN_SECCION_DE_GUARDIA, PRIMERA_SECCIN_INTERNA }

final seccionValues = EnumValues({
  "Primera Sección - Interna": Seccion.PRIMERA_SECCIN_INTERNA,
  "sin seccion de guardia": Seccion.SIN_SECCION_DE_GUARDIA
});

class SectorClass {
  SectorClass({
    this.idSector,
    this.sector,
    this.divisionId,
  });

  int? idSector;
  SectorEnum? sector;
  int? divisionId;

  factory SectorClass.fromJson(String str) =>
      SectorClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SectorClass.fromMap(Map<String, dynamic> json) => SectorClass(
        idSector: json["id_sector"],
        sector: sectorEnumValues.map![json["sector"]],
        divisionId: json["division_id"],
      );

  Map<String, dynamic> toMap() => {
        "id_sector": idSector,
        "sector": sectorEnumValues.reverse![sector],
        "division_id": divisionId,
      };
}

enum SectorEnum { SIN_SECTOR, PROGRAMACIN }

final sectorEnumValues = EnumValues({
  "Programación": SectorEnum.PROGRAMACIN,
  "sin sector": SectorEnum.SIN_SECTOR
});

class SexoClass {
  SexoClass({
    this.idSexo,
    this.sexo,
  });

  int? idSexo;
  SexoEnum? sexo;

  factory SexoClass.fromJson(String str) => SexoClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SexoClass.fromMap(Map<String, dynamic> json) => SexoClass(
        idSexo: json["id_sexo"],
        sexo: sexoEnumValues.map![json["sexo"]],
      );

  Map<String, dynamic> toMap() => {
        "id_sexo": idSexo,
        "sexo": sexoEnumValues.reverse![sexo],
      };
}

enum SexoEnum { FEMENINO, MASCULINO }

final sexoEnumValues = EnumValues(
    {"femenino": SexoEnum.FEMENINO, "masculino": SexoEnum.MASCULINO});

class SituacionClass {
  SituacionClass({
    this.idSituacion,
    this.situacion,
  });

  int? idSituacion;
  SituacionEnum? situacion;

  factory SituacionClass.fromJson(String str) =>
      SituacionClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SituacionClass.fromMap(Map<String, dynamic> json) => SituacionClass(
        idSituacion: json["id_situacion"],
        situacion: situacionEnumValues.map![json["situacion"]],
      );

  Map<String, dynamic> toMap() => {
        "id_situacion": idSituacion,
        "situacion": situacionEnumValues.reverse![situacion],
      };
}

enum SituacionEnum { ACTIVO, PASIVO }

final situacionEnumValues = EnumValues(
    {"Activo": SituacionEnum.ACTIVO, "Pasivo": SituacionEnum.PASIVO});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
