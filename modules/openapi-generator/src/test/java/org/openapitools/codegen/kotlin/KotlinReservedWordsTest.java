package org.openapitools.codegen.kotlin;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.Operation;
import io.swagger.v3.oas.models.media.Schema;
import io.swagger.v3.oas.models.parameters.Parameter;
import org.openapitools.codegen.*;
import org.openapitools.codegen.languages.KotlinClientCodegen;
import org.openapitools.codegen.utils.StringUtils;
import org.testng.annotations.DataProvider;
import org.testng.annotations.Test;

import java.util.HashSet;

import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertTrue;

@SuppressWarnings("rawtypes")
public class KotlinReservedWordsTest {
    final OpenAPI openAPI = TestUtils.parseFlattenSpec("src/test/resources/3_0/kotlin/reserved_words.yaml");

    @DataProvider(name = "reservedWords")
    static Object[][] reservedWords() {
        return new Object[][]{
               {"abstract"},
               {"annotation"},
               {"as"},
               {"break"},
               {"case"},
               {"catch"},
               {"class"},
               {"companion"},
               {"const"},
               {"constructor"},
               {"continue"},
               {"crossinline"},
               {"data"},
               {"delegate"},
               {"do"},
               {"else"},
               {"enum"},
               {"external"},
               {"false"},
               {"final"},
               {"finally"},
               {"for"},
               {"fun"},
               {"if"},
               {"in"},
               {"infix"},
               {"init"},
               {"inline"},
               {"inner"},
               {"interface"},
               {"internal"},
               {"is"},
               {"it"},
               {"lateinit"},
               {"lazy"},
               {"noinline"},
               {"null"},
               {"object"},
               {"open"},
               {"operator"},
               {"out"},
               {"override"},
               {"package"},
               {"private"},
               {"protected"},
               {"public"},
               {"reified"},
               {"return"},
               {"sealed"},
               {"super"},
               {"suspend"},
               {"tailrec"},
               {"this"},
               {"throw"},
               {"true"},
               {"try"},
               {"typealias"},
               {"typeof"},
               {"val"},
               {"var"},
               {"vararg"},
               {"when"},
               {"while"}
        };
    }

    @Test(dataProvider = "reservedWords")
    public void testReservedWordsAsModels(String reservedWord) {
        final DefaultCodegen codegen = new KotlinClientCodegen();
        final Schema schema = new Schema();
        final String escaped = "`" + reservedWord + "`";
        final String titleCased = StringUtils.camelize(reservedWord, false);

        codegen.setOpenAPI(openAPI);
        CodegenModel model = codegen.fromModel(reservedWord, schema);

        assertEquals(model.classname, titleCased);
        if ("class".equals(reservedWord)) {
            // this is a really weird "edge" case rename.
            assertEquals(model.classVarName, "propertyClass");
        } else {
            assertEquals(model.classVarName, escaped);
        }
        assertEquals(model.name, escaped);
        assertEquals(model.classFilename, titleCased);
    }

    @SuppressWarnings("OptionalGetWithoutIsPresent")
    @Test(dataProvider = "reservedWords")
    public void testReservedWordsAsParameters(String reservedWord) {
        final DefaultCodegen codegen = new KotlinClientCodegen();
        final String escaped = "`" + reservedWord + "`";
        codegen.setOpenAPI(openAPI);
        Operation operation = openAPI.getPaths().get("/ping").getGet();

        Parameter current = operation.getParameters().stream().filter(x -> reservedWord.equals(x.getName())).findFirst().get();
        CodegenParameter codegenParameter = codegen.fromParameter(current, new HashSet<>());

        assertEquals(current.getName(), reservedWord);
        if ("class".equals(reservedWord)) {
            assertEquals(codegenParameter.paramName, "propertyClass");
        } else {
            assertEquals(codegenParameter.paramName, escaped);
        }
    }

    @Test(dataProvider = "reservedWords")
    public void testReservedWordsAsProperties(String reservedWord) {
        final DefaultCodegen codegen = new KotlinClientCodegen();

        final String escaped = "`" + reservedWord + "`";
        final String titleCased = StringUtils.camelize(reservedWord, false);

        Schema linked = openAPI.getComponents().getSchemas().get("Linked");

        CodegenProperty property = codegen.fromProperty(reservedWord, (Schema) linked.getProperties().get(reservedWord));

        if ("object".equals(reservedWord)) {
            assertTrue(property.isPrimitiveType);
            assertEquals(property.dataType, "Any");
            assertEquals(property.datatypeWithEnum, "Any");
            assertEquals(property.baseType, "Any");
        } else {
            assertEquals(property.complexType, titleCased);
            assertEquals(property.dataType, titleCased);
            assertEquals(property.datatypeWithEnum, titleCased);
            assertEquals(property.baseType, titleCased);
        }

        if ("class".equals(reservedWord)) {
            // this is a really weird "edge" case rename.
            assertEquals(property.name, "propertyClass");
        } else {
            assertEquals(property.name, escaped);
        }

        assertEquals(property.baseName, reservedWord);
    }

}
